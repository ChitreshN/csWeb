#!/usr/bin/bash

psql -U postgres -d testdb -f ./_postgresDB/testdb.sql

LOC="./_data_csv"

rm _insert/courses.sql

for name in `ls $LOC`
do
    case "$name" in
        "btech.csv" | "btechAlumni.csv" | "mcam.csv" | "msocd.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name ${name%.*} faEmail> _insert/${name%.*}.sql
            ;;
        "internship.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name internship faculty > _insert/internship.sql
            ;;
        "talkseries.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name talkseries host > _insert/talkseries.sql
            ;;
        "courses_Core.csv" | "courses_Elective.csv")
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name courses >> _insert/courses.sql
            ;;
        *)
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
            ;;
    esac
done
