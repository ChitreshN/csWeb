import fs from "fs"
import papa from "papaparse"

const file = fs.createReadStream('uploads/adjfaculty.csv')

papa.parse(file,{
    header: true,
    step: function(result){
        console.log(result.data)
    }
})
