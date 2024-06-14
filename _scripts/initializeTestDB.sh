#!/usr/bin/bash

psql -U postgres -d testdb -f ./_postgresDB/testdb.sql

rm testInsert.sql
LOC="./_data_csv"
for name in `ls $LOC`
do
    if [ "$name" = "btech.csv" ] || [ "$name" = "btechAlumni.csv" ]; then
        echo processing $name
        python3 ./_scripts/csv2psql_btech.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
    else
        echo processing $name
        python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} > _insert/${name%.*}.sql
    fi
done
