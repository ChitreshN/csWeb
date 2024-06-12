#!/usr/bin/bash
psql -U postgres -d testdb -f ./_postgresDB/testdb.sql

rm testInsert.sql
LOC="./_data_csv"
for name in `ls $LOC` 
do
    echo processing $name
    python3 ./_scripts/csv2psql.py $LOC/$name ${name%.*} >> testInsert.sql ;
done
