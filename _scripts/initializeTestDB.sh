#!/usr/bin/bash

psql -U postgres -d testdb -f ./_postgresDB/testdb.sql -q

LOC="./_data_csv"

rm _insert/courses.sql

for name in `ls $LOC`
do
    case "$name" in
        # field to be replaced : faEmail
        "btech.csv" | "btechAlumni.csv" | "mcam.csv" | "msocd.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name ${name%.*} faEmail > _insert/${name%.*}.sql
            ;;
        # field to be replaced : faculty
        "internship.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name internship faculty > _insert/internship.sql
            ;;
        # field to be replaced : host
        "talkseries.csv")
            echo processing $name
            python3 ./_scripts/csv2psql_replace_email.py $LOC/$name talkseries host > _insert/talkseries.sql
            ;;
        # both these files should produce sql files for the courses table
        "courses_Core.csv" | "courses_Elective.csv")
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name courses >> _insert/courses.sql
            ;;
        # remaining files
        *)
            echo processing $name
            python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
            ;;
    esac
done
