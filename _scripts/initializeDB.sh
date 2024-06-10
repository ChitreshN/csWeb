#! /usr/bin/bash
psql -U postgres -d csdb -f ./_postgresDB/csdb.sql

LOC="./_data_csv"
for name in `ls $LOC` 
do
    echo processing $name
    python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} >> insert.sql ;
done
