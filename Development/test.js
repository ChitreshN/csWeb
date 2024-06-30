import express from "express";
import multer from 'multer'
import path from 'path';


const app = express();
const PORT = 3000;

// Configure storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
});

const upload = multer({ storage: storage });

// Create an uploads folder if it doesn't exist
import fs from "fs"
const uploadDir = 'uploads';
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir);
}

// Serve a simple form for file upload
app.get('/', (req, res) => {
    res.send(`
        <h2>Upload File</h2>
        <form action="/upload" method="POST" enctype="multipart/form-data">
            <input type="file" name="myFile" />
            <button type="submit">Upload</button>
        </form>
    `);
});

// Handle file upload
app.post('/upload', upload.single('myFile'), (req, res) => {
    res.send('File uploaded successfully!');
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

