import csv
import sqlite3
import sys

# Usage: python csv2sqlite2.py {csv-file-path} {sqlite-db-path} [{table-name}]
"""_summary_
references account(accnt_id)
    - file name of the csv file with keys should be 
        `<originalFileNameOfTable>_keys`
    - first line of the csv file with keys should be 
        `pk '\t' [comma separated primary keys]`
    - second and subsequent lines shall consist of foreign keys with format 
        `attributeName '\t' [comma separated <referencedTableName>(<referencedAttribName>)]`
"""

def create_table(cursor, table_name, headers, types,consStr):
    # Create a table with all fields as text
    create_table_query = f"CREATE TABLE {table_name} ({', '.join([f'{headers[i]} {types[i]}' for i in range(len(headers))])}" + f",{consStr})"
    cursor.execute(create_table_query)

# def insert_data(cursor, table_name, headers, data):
#     # Insert data into the table
#     insert_query = f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES ({', '.join(['?' for _ in headers])})"
#     cursor.executemany(insert_query, data)

def main(csv_file_path, sqlite_db_path, table_name):
    try:
        # Connect to SQLite database
        connection = sqlite3.connect(sqlite_db_path)
        cursor = connection.cursor()

        # Read CSV file
        print("ok1")
        with open(csv_file_path, 'r', newline='', encoding='utf-8') as file:
            with open(csv_file_path[:-4]+"_keys.csv", 'r', newline='', encoding='utf-8') as file_keys:
                reader = csv.reader(file, delimiter='\t')

                # Extract types, headers and data
                types = next(reader)
                for i, type in enumerate(types):
                    if type == "LIST(TEXT)":
                        types[i] = "TEXT"
                headers = next(reader)
                data = list(reader)
                print("ok2")
                reader_keys = csv.reader(file_keys, delimiter='\t')
                pk = next(reader_keys)
                fks = list(reader_keys)
                print(pk)
                print(fks)
        
        ####
        pk0 = pk[1]
        primKeyEntry = pk0.split()
        primKeys = primKeyEntry[0]
        # primKeyAts = []
        
        for primKey in primKeys.split(','):
            if primKey not in headers:
                raise Exception(f"{primKey} is not an attribute table {table_name}")
            # primKeyAts.append(headers.index(primKey))
            
        # for primKeyAt in primKeyAts:
        #     types[primKeyAt]+=" PRIMARY KEY"
        consStr = f"PRIMARY KEY({primKeys})"
        ####
        
        for fk in fks:
            fk0 = fk[0]
            attribName = fk0
            if attribName not in headers:
                raise Exception(f"{attribName} is not an attribute table {table_name}")
            
            fKeys = fk[1]
            
            consStr += f" FOREIGN KEY({attribName}) REFERENCES "+fKeys
        # return
        print(consStr)
        create_table(cursor, table_name, headers, types, consStr)

        # Insert data into the table
        # insert_data(cursor, table_name, headers, data)

        # Commit changes and close connection
        connection.commit()
        connection.close()

        print(f"Successfully created '{table_name}' table in the SQLite database.")

    except Exception as e:
        print(f"An error occurred: {str(e)}")

if __name__ == "__main__":
    # main("_data_csv/courses.csv", "_db/database_test.db", "courses")
    if len(sys.argv) != 4:
        print(f"Usage: python {sys.argv[0]} csv-file-path sqlite-db-path table-name")
    else:
        csv_file_path = sys.argv[1]
        sqlite_db_path = sys.argv[2]
        table_name = sys.argv[3]
        main(csv_file_path, sqlite_db_path, table_name)
