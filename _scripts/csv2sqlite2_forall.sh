#!/bin/bash
# ## TODO change to two step create insert; order running so as to not violate foreign key constraints
# csv_script="_scripts/csv2sqlite2.py"
# data_csv_folder="_data_csv"
# db_path="_db/database.db"

# for csv_file in $data_csv_folder/*.csv; do
#     filename=$(basename "$csv_file" .csv)
#     python "$csv_script" "$csv_file" "$db_path" "$filename"
# done

csv_script="_scripts/csv2sqlite2_createonly.py"
db_path="_db/database.db"
python3 "$csv_script" "_data_csv/faculty.csv" "$db_path" "faculty"
python3 "$csv_script" "_data_csv/adjfaculty.csv" "$db_path" "adjfaculty"
python3 "$csv_script" "_data_csv/cse_faculty.csv" "$db_path" "cse_faculty"
python3 "$csv_script" "_data_csv/btech.csv" "$db_path" "btech"