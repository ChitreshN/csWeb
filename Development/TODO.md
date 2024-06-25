# Features to be implemented
1. Allow update of fields via TSV alone (on all tables)
    - The website allows download of a dummy template CSV file with the header names and a link to upload the filled file (along with the operation to be performed.
    - Once the file is uploaded, the data is rigorously checked for correctness and make sure that dependencies are properly maintained.
    - Operations allowed are INSERT, UPDATE and DELETE. Do usual sanity checks and perform the operation. 
    - For data inserts, the info has to be validated (use the ISO 8601 YYYY-MM-DD format)
2. Ability to download the current data view (on all tables)
    - Allow a button to generate a CSV and save it in disk for the current view. If no data is displayed (intial stage), the button should be disabled.
3. Date filter for all tables
4. Filters for all fields in all tables.
5. Projects table
    - Field for PI in the DB (done via filter)



# Possible alternative(s)
 - [Mathesar](https://github.com/mathesar-foundation/mathesar?tab=readme-ov-file)
