#!/usr/bin/bash

LOC="./_insert"
for name in `ls $LOC`
do
    psql -U postgres -d testdb -f _insert/$name
done
