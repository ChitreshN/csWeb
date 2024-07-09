import express, { query } from "express";
import bodyParser from "body-parser";
import pg from "pg";
import env from "dotenv";
import { promises as pr } from 'fs';
import fs from "fs"
import multer from "multer"
import arrayToCSV from "./utils.js";
import processCSV from "./csv.js";
env.config();

const curDir = process.cwd()
const port=3000;
const app=express();

const db = new pg.Client({
    user: process.env.PG_USER,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE,
    password: process.env.PG_PASSWORD,
    port: process.env.PG_PORT,
  });
db.connect();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
});

const upload = multer({ storage: storage });

const uploadDir = 'uploads';
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir);
}
app.use(bodyParser.urlencoded({ limit: '1000mb', extended: true }));
app.use(express.static("public"));

app.get("/",async(req,res)=>{
    //to get list of all table names

    const result=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    res.render("index.ejs",{tables:result.rows});
});
app.post("/GetTableDropDown",async(req,res)=>{
    // console.log(req.body);
    var tableName=req.body.tableName;
    //to get list of table columns names
    const t=await db.query(" SELECT * FROM information_schema.columns WHERE table_name = $1;",[tableName]);
    
    var columns=[];
    for(var i=0;i<t.rows.length;i++)
    {
        columns.push(t.rows[i].column_name);
    }
    //to get list of all table names
    const result=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    res.render("index.ejs",{dataColumnNames:columns,tableName:tableName,tables:result.rows});
});



app.post("/displayTable",async(req,res)=>{
    // Log the body content for debugging
    // part2
    const result1=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    if(req.body.naturalLanguage){
    // console.log(req.body.naturalLanguage);
    try{
        const queryResult = await db.query(req.body.naturalLanguage);

        // Extract column names
        var temp = queryResult.fields.map(field => field.name);
        
        return res.render("index.ejs",{heading:temp,dataColumns:queryResult.rows,tables:result1.rows});
    }catch(err){
        return res.render(err.stack);
    }
}


    // part1
   
    const { tableName, ...columnsObject } = req.body;
    if (!tableName) {
      return res.status(400).send("Table name is required");
    }
    const t=await db.query(" SELECT * FROM information_schema.columns WHERE table_name = $1;",[tableName]);
    
    var dataColumnNames=[];
    for(var i=0;i<t.rows.length;i++)
    {
        dataColumnNames.push(t.rows[i].column_name);
    }
    const columnNames = Object.keys(columnsObject).map(col => `"${col}"`).join(', ');
    const columnNamesArray = Object.keys(columnsObject).map(col => `${col}`);

    // console.log(columnNamesArray);
    const result = await db.query(`SELECT ${columnNames} FROM "${tableName}"`);

    // check if table is empty
    if (!result.rows[0]) {
        return res.send("No entries for selected table")
    }
    const heading=Object.keys(result.rows[0]);
    res.render("index.ejs",{heading:heading,dataColumns:result.rows,tableName:tableName,heading:heading,tables:result1.rows,columnNamesArray:columnNamesArray,dataColumnNames:dataColumnNames});
});

app.post("/getCSV", async(req,res)=> {
    const tableName = req.body.tableName
    const dataColumns = req.body.dataColumns
    const heading = req.body.heading
    if (!tableName){
        res.send("Select table before downloading csv")
        return
    }
    
    const csv = arrayToCSV(heading,dataColumns)
    
    const fileName = `${tableName}.csv`

    await pr.writeFile(fileName, csv)

    res.setHeader('Content-Disposition', 'attachment; filename=' + fileName);
    await new Promise((resolve, reject) => {
        res.sendFile(fileName, { root: curDir }, (err) => {
            if (err) reject(err);
            else resolve();
        });
    });

    // Delete the file after sending
    await pr.unlink(fileName);
})

// handler for inserting entries in database
app.post('/insertDB', upload.single('myFile'), async(req, res) => {
    const filepath = `uploads/${req.file.originalname}`
    const tableName = req.body.tableName

    const csv = fs.createReadStream(filepath)    
    
    const {fields, data} = await processCSV(csv)

    const columnNames = fields.map(col => `"${col}"`).join(', ');

    for (const values of data){
        const dataString = values.map(val => `'${val}'`).join(', ')
        try{
            await db.query(`INSERT INTO "${tableName}"(${columnNames}) VALUES (${dataString})`)
        }
        catch(error){
            console.log(error)
            res.send(`the following error occured: ${error.detail}`)
            return
        }
    }
    res.send('Values inserted successfully!');
});

app.post('/updateDB', upload.single('myFile'), async(req, res) => {
    // send insert csv, but when updating, use this information
    // i.e the primary key column
    const filepath = `uploads/${req.file.originalname}`
    const tableName = req.body.tableName

    const primary_key = await db.query(`
        SELECT 
        c.column_name, 
        c.data_type
        FROM 
        information_schema.table_constraints tc 
        JOIN 
        information_schema.constraint_column_usage AS ccu 
        USING (constraint_schema, constraint_name) 
        JOIN 
        information_schema.columns AS c 
        ON c.table_schema = tc.constraint_schema
        AND tc.table_name = c.table_name 
        AND ccu.column_name = c.column_name
        WHERE 
        constraint_type = 'PRIMARY KEY' 
        AND tc.table_name = '${tableName}';
        `)

    const column = primary_key.rows[0].column_name
    if (!column) res.send('No primary key for the table') //TODO handle this case better
    const csv = fs.createReadStream(filepath)    

    const {fields, data} = await processCSV(csv)

    for (const values of data){
        let j = 0
        let key
        let updateString = ''
        for (let i=0; i < values.length ;i++) {
            if (fields[i] == column) {
                key = values[i]
                continue
            }
            if (j == 0){
                updateString += ` "${fields[i]}" = '${values[i]}' `
                j++;
            }
            else updateString += `, "${fields[i]}" = '${values[i]}' `
        }
       try{
           await db.query(`
               update ${tableName}
               set ${updateString}
               where "${column}" = '${key}';
               `)
       }
       catch(error){
           console.log(error)
           res.send(`the following error occured: ${error.detail}`)
           return
       }
    }
    res.send("Information updated for the given values!");
});

// handler for deleting entries from database
// TODO
app.post('/deleteDB', upload.single('myFile'), async(req, res) => {
    const filepath = `uploads/${req.file.originalname}`
    const tableName = req.body.tableName

    const primary_key = await db.query(`
        SELECT 
        c.column_name, 
        c.data_type
        FROM 
        information_schema.table_constraints tc 
        JOIN 
        information_schema.constraint_column_usage AS ccu 
        USING (constraint_schema, constraint_name) 
        JOIN 
        information_schema.columns AS c 
        ON c.table_schema = tc.constraint_schema
        AND tc.table_name = c.table_name 
        AND ccu.column_name = c.column_name
        WHERE 
        constraint_type = 'PRIMARY KEY' 
        AND tc.table_name = '${tableName}';
        `)

    const column = primary_key.rows[0].column_name
    if (!column) res.send('No primary key for the table') //TODO handle this case better
    const csv = fs.createReadStream(filepath)    
    
    const {fields, data} = await processCSV(csv)

    for (const values of data){
        let key
        for (let i=0; i < values.length ;i++) {
            if (fields[i] == column) {
                key = values[i]
                continue
            }
        }
        try{
            await db.query(`DELETE FROM "${tableName}" 
               WHERE "${column}" = '${key}';
            `)
        }
        catch(error){
            console.log(error.detail)
            res.send(`the following error occured: ${error.detail}`)
            return
        }
    }
    res.send('Entries deleted!');
});

app.post("/getTemplate", async(req,res)=> {
    const tableName = req.body.tableName
    if (!tableName){
        res.send("Select table before downloading csv")
        return
    }
    const cols = await db.query(" SELECT * FROM information_schema.columns WHERE table_name = $1;",[tableName]);
    
    var dataColumnNames=[];
    for(var i=0;i<cols.rows.length;i++)
    {
        dataColumnNames.push(cols.rows[i].column_name);
    }

    var data = []

    const csv = arrayToCSV(dataColumnNames,data)
    const fileName = `${tableName}.csv`

    await pr.writeFile(fileName, csv)

    res.setHeader('Content-Disposition', 'attachment; filename=' + fileName);
    await new Promise((resolve, reject) => {
        res.sendFile(fileName, { root: curDir }, (err) => {
            if (err) reject(err);
            else resolve();
        });
    });

    // Delete the file after sending
    await pr.unlink(fileName);
})


app.listen(port,()=>{
    console.log(`running on port ${port}`);
});


