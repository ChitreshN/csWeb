#!/bin/bash
set -e

if [ $# -gt 2 ]
then
	echo `basename $0` " - updates an _data file provided as input from google drive"
	echo "error: Expected one filename from _data"
	exit 1
fi

data_file=$1
data_file_no_extension=${data_file%.*}
sheet_name=$2

if [ "$sheet_name" == "" ];
then
    # Download the csv file
    python3 connect_to_drive.py $data_file_no_extension  $data_file_no_extension 
else
    # Download the csv file
    python3 connect_to_drive.py $data_file_no_extension $sheet_name
    mv $sheet_name.csv $data_file_no_extension.csv
fi
    

# Convert the csv to yaml
echo "Convert csv to yaml"
python3 _data.py ${data_file_no_extension}.csv


# Move the yaml file to _data
echo "Copying the yaml file to _data"
mv ${data_file_no_extension}.yml ../_data
rm ${data_file_no_extension}.csv

