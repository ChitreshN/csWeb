import express from "express";
import ejs from "ejs";
import bodyParser from "body-parser";
import pg from "pg";
import env from "dotenv";
import axios from 'axios';
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
    var create_table_statements="CREATE TABLE allfaculty ( name VARCHAR, designation VARCHAR, edu VARCHAR, url VARCHAR, joined VARCHAR, phone VARCHAR, email VARCHAR PRIMARY KEY, research VARCHAR, iitpkdpubid VARCHAR, office VARCHz2AR); CREATE TABLE adjfaculty ( affiliation VARCHAR, email VARCHAR PRIMARY KEY, expertise VARCHAR); CREATE TABLE announce ( UniqueID SERIAL PRIMARY KEY, date VARCHAR, title VARCHAR, show BOOLEAN, description VARCHAR, notifypublic BOOLEAN, link VARCHAR); CREATE TABLE awards ( UniqueID SERIAL PRIMARY KEY, title VARCHAR, description VARCHAR, date VARCHAR, show BOOLEAN); CREATE TABLE btech ( year INT, name VARCHAR, rollno INT PRIMARY KEY, faEmail VARCHAR); CREATE TABLE btechAlumni ( year INT, name VARCHAR, rollno INT PRIMARY KEY, faEmail VARCHAR); CREATE TABLE carousels ( UniqueID SERIAL PRIMARY KEY, image VARCHAR); CREATE TABLE colloquium ( UniqueID SERIAL PRIMARY KEY, title VARCHAR, speaker VARCHAR, description VARCHAR, speakerbio VARCHAR, date VARCHAR, time VARCHAR, venue VARCHAR, host VARCHAR, show BOOLEAN, images LIST(VARCHAR), imagesLayout VARCHAR); CREATE TABLE currentCourses ( code VARCHAR PRIMARY KEY, fac_email LIST(VARCHAR), slot VARCHAR, room VARCHAR); CREATE TABLE currentNPTELCourses ( code VARCHAR PRIMARY KEY, title VARCHAR, credits VARCHAR, link VARCHAR); CREATE TABLE cse_faculty ( email VARCHAR PRIMARY KEY); CREATE TABLE internship ( UniqueID SERIAL PRIMARY KEY, name VARCHAR, facEmail VARCHAR, numpos VARCHAR, duration VARCHAR, apply VARCHAR); CREATE TABLE mcam ( year INT, name VARCHAR, rollno INT PRIMARY KEY, fa VARCHAR); CREATE TABLE mcamAlumni ( year INT, name VARCHAR, rollno INT PRIMARY KEY); CREATE TABLE msAlumni ( year INT, name VARCHAR, rollno VARCHAR PRIMARY KEY, program VARCHAR, doj VARCHAR, area VARCHAR, advisor VARCHAR, thesisTitle VARCHAR); CREATE TABLE msocd ( year INT, name VARCHAR, rollno INT PRIMARY KEY, fa VARCHAR); CREATE TABLE msocdAlumni ( year INT, name VARCHAR, rollno INT PRIMARY KEY); CREATE TABLE openPos ( UniqueID SERIAL PRIMARY KEY, name VARCHAR, faculty VARCHAR, quals VARCHAR, numpos VARCHAR, responsibility VARCHAR, apply VARCHAR); CREATE TABLE courses ( code VARCHAR PRIMARY KEY, title VARCHAR, core LIST(VARCHAR), credits VARCHAR, category VARCHAR, proposingfaculty_email LIST(VARCHAR), curriculum LIST(VARCHAR), prereq VARCHAR); CREATE TABLE pastCourses ( year INT, semester VARCHAR, code VARCHAR, name VARCHAR, fac_email VARCHAR, slot VARCHAR, room VARCHAR, PRIMARY KEY (year, code)); CREATE TABLE phdAlumni ( year INT, name VARCHAR, rollno INT PRIMARY KEY, doj VARCHAR, area VARCHAR, advisor VARCHAR, thesisTitle VARCHAR, thesis_submitted VARCHAR, next VARCHAR); CREATE TABLE postdoc ( name VARCHAR, email VARCHAR PRIMARY KEY, research VARCHAR, host VARCHAR, url VARCHAR); CREATE TABLE projects ( projID VARCHAR PRIMARY KEY, projectdetails VARCHAR, duration VARCHAR, fundingagency VARCHAR, projecttype VARCHAR, projectnumber VARCHAR, totalbudget VARCHAR); CREATE TABLE projectFaculty ( projID VARCHAR, facEmail VARCHAR, isPrincipal BOOLEAN, PRIMARY KEY (projID, facEmail)); CREATE TABLE PhDscholars ( name VARCHAR, rollno VARCHAR PRIMARY KEY, program VARCHAR, doj VARCHAR, area VARCHAR, url VARCHAR, type VARCHAR, otherdepartment VARCHAR); CREATE TABLE PhDscholarAdvisor ( rollno VARCHAR, facEmail VARCHAR, PRIMARY KEY (rollno, facEmail)); CREATE TABLE MSscholars ( name VARCHAR, rollno VARCHAR PRIMARY KEY, program VARCHAR, doj VARCHAR, area VARCHAR, url VARCHAR, type VARCHAR, otherdepartment VARCHAR); CREATE TABLE MSscholarAdvisor ( rollno VARCHAR, facEmail VARCHAR, PRIMARY KEY (rollno, facEmail)); CREATE TABLE staff ( name VARCHAR, office VARCHAR, designation VARCHAR, email VARCHAR PRIMARY KEY, details VARCHAR); CREATE TABLE stats ( year INT PRIMARY KEY, btech INT, mtech INT, ms INT, phd INT); CREATE TABLE talks ( title VARCHAR, speaker VARCHAR, description VARCHAR, speakerbio VARCHAR, date VARCHAR, time VARCHAR, venue VARCHAR, host VARCHAR, show BOOLEAN, type VARCHAR, images LIST(VARCHAR), PRIMARY KEY (speaker, venue)); CREATE TABLE talkseries ( UniqueID SERIAL PRIMARY KEY, title VARCHAR, speaker VARCHAR, speakerbio VARCHAR, description VARCHAR, date VARCHAR, venue VARCHAR, host VARCHAR, show BOOLEAN, images LIST(VARCHAR), imagesLayout VARCHAR); CREATE TABLE workshops ( UniqueID SERIAL PRIMARY KEY, date DATE, title VARCHAR, link VARCHAR, description VARCHAR); ALTER TABLE allfaculty ADD FOREIGN KEY (email) REFERENCES adjfaculty (email); ALTER TABLE btech ADD FOREIGN KEY (faEmail) REFERENCES allfaculty (email); ALTER TABLE btechAlumni ADD FOREIGN KEY (faEmail) REFERENCES allfaculty (email); ALTER TABLE allfaculty ADD FOREIGN KEY (email) REFERENCES cse_faculty (email); ALTER TABLE internship ADD FOREIGN KEY (facEmail) REFERENCES allfaculty (email); ALTER TABLE mcam ADD FOREIGN KEY (fa) REFERENCES allfaculty (email); ALTER TABLE projectFaculty ADD FOREIGN KEY (facEmail) REFERENCES allfaculty (email); ALTER TABLE projectFaculty ADD FOREIGN KEY (projID) REFERENCES projects (projID); ALTER TABLE PhDscholarAdvisor ADD FOREIGN KEY (facEmail) REFERENCES allfaculty (email); ALTER TABLE PhDscholarAdvisor ADD FOREIGN KEY (rollno) REFERENCES PhDscholars (rollno); ALTER TABLE MSscholarAdvisor ADD FOREIGN KEY (facEmail) REFERENCES allfaculty (email); ALTER TABLE MSscholarAdvisor ADD FOREIGN KEY (rollno) REFERENCES MSscholars (rollno); ALTER TABLE talkseries ADD FOREIGN KEY (host) REFERENCES allfaculty (email); ALTER TABLE msocd ADD FOREIGN KEY (fa) REFERENCES allfaculty (email); ALTER TABLE currentCourses ADD FOREIGN KEY (code) REFERENCES courses (code); ALTER TABLE pastCourses ADD FOREIGN KEY (code) REFERENCES courses (code);";
    // temp = temp.replace("{user_question}", naturalLanguage);
    
    const temp={
        "prompt": `<|start_header_id|>user<|end_header_id|> Generate a SQL query to answer this question: ${naturalLanguage} {instructions} DDL statements: ${create_table_statements}<|eot_id|> <|start_header_id|>assistant<|end_header_id|> The following SQL query best answers the question ${naturalLanguage} \n \`\`\` sql:`
    }
    // console.log(temp);
    // console.log(temp);
    try{
    // console.log(naturalLanguage);
        const response = await axios.post("http://localhost:8080/completion", {
            data: temp
        });
        console.log(response.data); 
        const result=await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
        res.render("index.ejs",{query:response.data,tables:result.rows});
    }catch(error){
        res.send(error.stack);
    }
});
app.listen(port,()=>{
    console.log(`running on port ${port}`);
});


