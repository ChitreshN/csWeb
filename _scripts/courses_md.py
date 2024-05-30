import os
import csv
import yaml

def process_files(directory_path, output_csv_path, predefined_fieldnames, types):
    fieldnames = set()

    # Create or open the CSV file for writing
    with open(output_csv_path, 'w', newline='', encoding='utf-8') as csvfile:
        csvwriter = csv.DictWriter(csvfile, fieldnames=types, delimiter='\t')
        csvwriter.writeheader()
        csvwriter = csv.DictWriter(csvfile, fieldnames=predefined_fieldnames, delimiter='\t')
        csvwriter.writeheader()

        # Iterate over files in the given directory
        for filename in os.listdir(directory_path):
            if filename.endswith('.md'):  # Adjust the file extension if needed
                file_path = os.path.join(directory_path, filename)

                # Read the entire file content
                with open(file_path, 'r', encoding='utf-8') as file:
                    file_content = file.read()

                # Find the start and end indices of YAML front matter
                start_index = file_content.find('---') + 3
                print(start_index)
                print(file_path)
                end_index = file_content.find('---', start_index)

                # Extract YAML front matter
                yaml_content = file_content[start_index:end_index].strip()

                # Read the YAML front matter
                front_matter = yaml.safe_load(yaml_content)

                # Filter front matter based on predefined fieldnames
                filtered_front_matter = {key: front_matter[key] for key in predefined_fieldnames if key in front_matter}

                # Write the data to the CSV file
                csvwriter.writerow(filtered_front_matter)

if __name__ == "__main__":
    input_directory = 'courses'  # Replace with the actual directory path
    output_csv = '_data_csv/courses.csv'  # Replace with the desired output CSV file name
    types = ['TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT', 'TEXT']
    predefined_fieldnames = ['code', 'title', 'core', 'credits', 'category', 'proposingfaculty', 'curriculum', 'prereq']  # Replace with your predefined fieldnames
    process_files(input_directory, output_csv, predefined_fieldnames, types)