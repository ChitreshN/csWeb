import express, { query } from "express";
import bodyParser from "body-parser";
import pg from "pg";
import env from "dotenv";
import { promises as pr } from 'fs';
import fs from "fs"
import multer from "multer"
import arrayToCSV from "./utils.js";
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

app.use(bodyParser.urlencoded({extended:true}));
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
    res.render("index.ejs",{dataColumns:result.rows,tableName:tableName,heading:heading,tables:result1.rows,columnNamesArray:columnNamesArray,dataColumnNames:dataColumnNames});
});

app.post("/getCSV", async(req,res)=> {
    const tableName = req.body.tableName
    const dataColumns = req.body.dataColumns
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
    
    const csv = arrayToCSV(dataColumnNames,dataColumns)
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


//TODO
app.post('/sendCSV', upload.single('myFile'), (req, res) => {
    res.send('File uploaded successfully!');
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


