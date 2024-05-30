#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Expects CSV filename as the only argument"
fi

# Generate course updates using yq and execute them using bash
CWD=`pwd`

cd ../courses
python3 ../_scripts/_course.py ../_scripts/$1 | bash

# Fix up for a bug in yq
sed -i -e "s/['\"]\[/\[/g" -e "s/\]['\"]/\]/g" *.md

cd $CWD
