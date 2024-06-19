#!/usr/bin/bash
# TODO 
# 1. gen sql queries based on the files in insert/ DONE
# 2. run sql queries and compare output with no of lines in each of the sql files, DONE
# 3. if the values are not the same then echo out the file name DONE

LOC="./_insert"
problems=()

for name in `ls $LOC`
do
    echo ${name%.*} >> count
    psql -U postgres -d testdb -c "SELECT COUNT(*) FROM \"${name%.*}\"" > count
    row_count=$(sed -n '3{s/[[:space:]]//g;p;}' count)

    line_count=$(wc -l < "./_insert/$name")

    if [ "$row_count" -ne "$line_count" ]; then
        problems+=("$name")
    fi
done

if [ ${#problems[@]} -eq 0 ]; then
    echo "All tests passed"
else
    echo "Files with problems:"
    for problem in "${problems[@]}"; do
        echo "$problem"
    done
    exit 1
fi

