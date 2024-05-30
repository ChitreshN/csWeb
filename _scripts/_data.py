# Script to update a yml file in _data folder from a csv with the same name

import csv, sys, re
import dateutil.parser as parser

if len(sys.argv) != 2:
    print("Input csv file expected")
    sys.exit(1)


inp_csv_file=sys.argv[1]
target_yml_file=inp_csv_file[:-3]+"yml"

fields = []

def get_location(row, string):
    location = 0;
    for s in row:
        if string == s:
            return location
        location = location + 1

    # Lol should never get here :P
    return -100

yaml_text="list:"

with open(inp_csv_file) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0

    header = []
    for row in csv_reader:
        if line_count == 0:
            header = row

            for i in range(len(header)):
                # remove all special characters, blank space and get the name
                out = ''.join(filter(str.isalnum, header[i])).lower()
                fields.append(out)

        else:
            yaml_text+="\n"
            # Only get data upto length of the row
            for i in range(len(row)):

                # Pad with appropriate space
                if i == 0:
                    begin = "- "
                else:
                    begin = "  "

                # Update an entry only if there is some data
                if (len(row[i])):
                    if fields[i] == "date":
                        date = parser.parse(row[i])
                        yaml_text += begin+fields[i] + ": \"" + str(date.isoformat()) + "\"\n"
                    elif not row[i].isalpha():
                        # Use quote and also appropriately add escape sequences.
                        yaml_text += begin+fields[i] + ": \"" + str(row[i].replace("\n","\n\n")).replace("\\", "\\\\").replace("\"", "\'") + "\"\n"
                    else:
                        yaml_text += begin+fields[i] + ": " + row[i] + "\n"
                        

        line_count += 1

new_yaml = open(target_yml_file, 'w')
# Write our YAML string to the new text file and close it.
new_yaml.write(yaml_text)
new_yaml.close()

#print(f'Processed {line_count} lines.')

