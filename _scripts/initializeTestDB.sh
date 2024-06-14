#!/usr/bin/bash

psql -U postgres -d testdb -f ./_postgresDB/testdb.sql

LOC="./_data_csv"

rm _insert/courses.sql

for name in `ls $LOC`
do
    case "$name" in
        "btech.csv" | "btechAlumni.csv" | "mcam.csv" | "msocd.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_btech.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
            ;;
        "courses_Core.csv" | "courses_Elective.csv")
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name courses >> _insert/courses.sql
            ;;
        "internship.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_internship.py $LOC/$name internship > _insert/internship.sql
            ;;
        "talkseries.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_talkseries.py $LOC/$name talkseries > _insert/talkseries.sql
            ;;
        *)
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
            ;;
    esac
done
