# Instructions for running the Fetch-CSE-Data
The steps involved are

0. Setup google drive access credentials and necessary packages
1. Setup node server
2. Setup Llama
3. Final setup


## 0. Setup the google drive access

* Install the following packages using pip3
	- pip3 install apiclient
	- pip3 install oauth2client
	- pip3 install python-dateutil

* Follow the instructions given in the following links to setup the credentials
 - https://towardsdatascience.com/how-to-download-a-specific-sheet-by-name-from-a-google-spreadsheet-as-a-csv-file-e8c7b4b79f39
 - https://levelup.gitconnected.com/google-drive-api-with-python-part-ii-connect-to-google-drive-and-search-for-file-7138422e0563
 - https://medium.com/swlh/google-drive-api-with-python-part-i-set-up-credentials-1f729cb0372b

## 1. Setup node server

* Install postgres using apt / package manager. To enable (unrestricted !) database access, add the following 
	``` bash
		*:*:*:*:postgres
	```
to a file named `.pgpass` in $HOME. This should allow access all data via scripts. 

* cd into `Development` directory in the repo and do
	- `npm i`
  This will download all the necessary node packages. 

* Add a `.env` file with contents
	``` bash
		PG_USER="postgres"
		PG_HOST="localhost"
		PG_DATABASE="testdb"
		PG_PORT="5432"
	```

## 2. Setting up Llama.
Check the readme folder in llama folder of the repo.

## 3. Final setup

1. Download the csv files from google drive. Run
	``` bash
	   ./_scripts/downloadAllCSVs.sh
	```

2. Run `./_scripts/main.sh` to do
	- Create database
	- Insert the csv data into the database
	- Test if all data is inserted properly (only count check is done)
	- Starts the node server which runs in port 3000. Port 3000 is forwarded to 80 using apache2 http_proxy module.

