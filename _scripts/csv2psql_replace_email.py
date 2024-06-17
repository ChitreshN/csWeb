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


if len(sys.argv) != 4:
    print("Error: expected file name as an argument")
    print("python3 _scripts/csv2psql.py {file_name} {table_name} {email_field}")
    sys.exit(1)
else:
    csv_file_name = sys.argv[1]
    table_name = sys.argv[2]
    email_field = sys.argv[3]

fields = []
types = []
data = []

with open(csv_file_name, 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter='\t')

    types = next(csv_reader)
    fields = next(csv_reader)

    for row in csv_reader:
        data.append(row)


# column to be replaced compile
col = 0
for i in range(len(fields)):
    if (fields[i] == email_field):
        col = i
        break

field_names = ', '.join(f'"{field}"' for field in fields)
# create a dictionary that hold the faculty emails
email_dict = {}

with open('_data_csv/allfaculty.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter='\t')
    types = next(csv_reader)
    fields = next(csv_reader)
    new_reader = csv.DictReader(csv_file,
                                delimiter='\t',
                                fieldnames=fields)
    for faculty_row in new_reader:
        email_dict[faculty_row['name']] = faculty_row['email']

# replace names with emails
for row in data:
    if (not (row[col] == '')):
        row[col] = email_dict[row[col]]

for row in data:
    for i in range(len(row)):
        row[i] = row[i].replace("'", "")
        row[i] = row[i].replace('[', '{')  # proper syntax for lists
        row[i] = row[i].replace(']', '}')
    data_string = ', '.join(f"'{value}'" for value in row)
    print(f'Insert into "{table_name}"({field_names}) values ({data_string});')
