import csv
import yaml
from ordered_set import OrderedSet

# Load YAML data
with open('_data/colloquium.yml', 'r') as file:
    data = yaml.safe_load(file)

# Specify the CSV file path
csv_file_path = '_data_csv/colloquium.csv'

# Open the CSV file in write mode
with open(csv_file_path, 'w') as csv_file:
    # Create a CSV writer
    csv_writer = csv.writer(csv_file, delimiter='\t')

    # Write the dynamic header row
    header = set()
    for entry in data['list']:
        header.update(entry.keys())
    #csv_writer.writerow(['INTEGER', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT'])
    # beware!
    # used an ordered set as otherwise this won't be in order
    csv_writer.writerow(list(header))

    # Write the data rows
    for entry in data['list']:
        
        # reg = entry['registered']
        # semester = entry['prog']

        row_data = []
        row_data += [entry.get(field, '') for field in header]
        csv_writer.writerow(row_data)
