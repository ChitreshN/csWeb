import csv
import sqlite3
import sys

# Usage: python csv2sqlite2.py {csv-file-path} {sqlite-db-path} [{table-name}]

# def create_table(cursor, table_name, headers, types):
#     # Create a table with all fields as text
#     create_table_query = f"CREATE TABLE {table_name} ({', '.join([f'{headers[i]} {types[i]}' for i in range(len(headers))])})"
#     cursor.execute(create_table_query)

def insert_data(cursor, table_name, headers, data):
    # Insert data into the table
    insert_query = f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES ({', '.join(['?' for _ in headers])})"
    cursor.executemany(insert_query, data)

def main(csv_file_path, sqlite_db_path, table_name):
    try:
        # Connect to SQLite database
        connection = sqlite3.connect(sqlite_db_path)
        cursor = connection.cursor()

        # Read CSV file
        with open(csv_file_path, 'r', newline='', encoding='utf-8') as file:
            reader = csv.reader(file, delimiter='\t')

            # Extract types, headers and data
            types = next(reader)
            headers = next(reader)
            data = list(reader)


        # create_table(cursor, table_name, headers, types)

        # Insert data into the table
        insert_data(cursor, table_name, headers, data)

        # Commit changes and close connection
        connection.commit()
        connection.close()

        print(f"CSV data successfully added to the '{table_name}' table in the SQLite database.")

    except Exception as e:
        print(f"An error occurred: {str(e)}")

if __name__ == "__main__":
    if len(sys.argv) is not 4:
        print("Usage: python script.py {csv-file-path} {sqlite-db-path} {table-name}")
    else:
        csv_file_path = sys.argv[1]
        sqlite_db_path = sys.argv[2]
        table_name = sys.argv[3]
        main(csv_file_path, sqlite_db_path, table_name)
