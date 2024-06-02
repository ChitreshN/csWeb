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
    const result=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    res.render("index.ejs",{tables:result.rows});
});
app.post("/GetTableDropDown",async(req,res)=>{

    var tableName=req.body.tableName;
    
    const t=await db.query(" SELECT * FROM information_schema.columns WHERE table_name = $1;",[tableName]);
    
    var columns=[];
    for(var i=0;i<t.rows.length;i++)
    {
        columns.push(t.rows[i].column_name);
    }
  
    res.render("index.ejs",{columns:columns,tableName:tableName});
});
app.post("/displayTable",async(req,res)=>{
    // Log the body content for debugging
   

    // Extract tableName from req.body
    const { tableName, ...columnsObject } = req.body;

    // Check if tableName is provided
    if (!tableName) {
      return res.status(400).send("Table name is required");
    }

    // Extract keys from the remaining object (excluding tableName)
    const columns = Object.keys(columnsObject);

    // Join columns to create the SELECT statement
    const columnNames = columns.join(", ");

    // Construct the SQL query
    const result = await db.query(`SELECT ${columnNames} FROM ${tableName}`);
    
    const heading=Object.keys(result.rows[0]);
    
    res.render("index.ejs",{data:result.rows,tableName:tableName,heading:heading});

});
app.listen(port,()=>{
    console.log(`running on port ${port}`);
});
