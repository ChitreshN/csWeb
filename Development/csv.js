import papa from "papaparse"

function processCSV(csv){
    return new Promise((resolve, reject) => {

        let i = 0
        let fields = []
        let data = []

        papa.parse(csv,{
            delimiter: '\t',
            step: function(result){
                if (i == 0){
                    for (const value of result.data) {
                        fields.push(value)
                    }
                    i += 1
                }
                else data.push(result.data)
            },
            complete: function(){
                resolve({fields, data})
            },
            error: function(error){
                reject(error)
            }
        })

    })
}

export default processCSV
