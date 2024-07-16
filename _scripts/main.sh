#!/usr/bin/bash

# download csv
./_scripts/downloadAllCSVs.sh

# refresh db

psql -U postgres -d postgres -c "DROP DATABASE IF EXISTS testdb;"
psql -U postgres -d postgres -c "create database testdb;"

# initialize db and process files
./_scripts/initializeTestDB.sh

# populate db
./_scripts/populateTestDB.sh

# TODO test
./_scripts/test.sh

# start the server
cd Development
node index.js
