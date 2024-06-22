import express from "express";
import ejs from "ejs";
import bodyParser from "body-parser";
import pg from "pg";
import env from "dotenv";
env.config();
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
    const result1=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
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
// chnaging natural language to sql query 
app.post("/queryDisplay",async(req,res)=>{
    var naturalLanguage=req.body.naturalLanguage;
    try{
        const response=await axios.get("localhost:8080/completion");
        console.log(response);
        res.send("hello");
    }catch(error){

    }
    const result=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    res.render("index.ejs",{query:naturalLanguage,tables:result.rows});
});
app.listen(port,()=>{
    console.log(`running on port ${port}`);
});
