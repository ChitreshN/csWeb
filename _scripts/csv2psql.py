'''
script to produce insert into statements for data in a csv file
format of csv file
1st row contains fields
2nd row contains data types
data from 3rd row
script does not verify if types are correct, err will be reported
by psql client instead
'''

import csv
import sys

if len(sys.argv) != 3:
    print("Error: expected file name as an argument")
    print("python3 _scripts/csv2psql.py {file_name} {table_name}")
    sys.exit(1)
else:
    csv_file_name = sys.argv[1]
    table_name = sys.argv[2]

fields = []
types = []
data = []

with open(csv_file_name, 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter='\t')

    fields = next(csv_reader)

    for row in csv_reader:
        data.append(row)

field_names = ', '.join(f'"{field}"' for field in fields)

for row in data:
    for i in range(len(row)):
        row[i] = row[i].replace("\n", "")
        row[i] = row[i].replace("'", "")
        row[i] = row[i].replace('[', '{')  # proper syntax for lists
        row[i] = row[i].replace(']', '}')
    data_string = ', '.join(f"'{value}'" for value in row)
    print(f'Insert into "{table_name}"({field_names}) values ({data_string});')
