#!/usr/bin/bash

LOC="./_insert"
echo "Inserting data"
for name in `ls $LOC`
do
    psql -U postgres -d testdb -f _insert/$name -q
done
echo "Done"
