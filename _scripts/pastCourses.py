import csv
import yaml
from ordered_set import OrderedSet

# Load YAML data
with open('_data/talkseries.yml', 'r') as file:
    data = yaml.safe_load(file)

# Specify the CSV file path
csv_file_path = '_data_csv/talkseries.csv'

# Open the CSV file in write mode
with open(csv_file_path, 'w') as csv_file:
    # Create a CSV writer
    csv_writer = csv.writer(csv_file, delimiter='\t')

    # Write the dynamic header row
    header = set()
    for entry in data['list']:
        for course in entry['graduants']:
            header.update(course.keys())
    #csv_writer.writerow(['INTEGER', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT'])
    # beware!
    # used an ordered set as otherwise this won't be in order
    csv_writer.writerow(['year'] + list(header))

    # Write the data rows
    for entry in data['list']:
        year = entry['year']
        # reg = entry['registered']
        # semester = entry['prog']
        for course in entry['graduants']:
            row_data = [year]
            row_data += [course.get(field, '') for field in header]
            csv_writer.writerow(row_data)
