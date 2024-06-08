# Code stolen from 
# - https://towardsdatascience.com/how-to-download-a-specific-sheet-by-name-from-a-google-spreadsheet-as-a-csv-file-e8c7b4b79f39
# - https://levelup.gitconnected.com/google-drive-api-with-python-part-ii-connect-to-google-drive-and-search-for-file-7138422e0563
# - https://medium.com/swlh/google-drive-api-with-python-part-i-set-up-credentials-1f729cb0372b
# ... with some minor fixes



from googleapiclient import discovery, errors 
from httplib2 import Http
from oauth2client import client, file, tools
import csv, sys


if len(sys.argv) != 3:
    print("Program to download spreadsheet files in google drive using the drive api")
    print("Error: Expected name of the spreadsheet file and the name of the sheet within the spreadsheet")
    sys.exit(1)
else:
    spreadsheet_name = sys.argv[1]
    sheet_name = sys.argv[2]


# define path variables
credentials_file_path = './_scripts/credentials/credentials.json'
clientsecret_file_path = './_scripts/credentials/client_secret.json'

# define API scope
SCOPE = 'https://www.googleapis.com/auth/drive'

# define store
store = file.Storage(credentials_file_path)
credentials = store.get()# get access token
if not credentials or credentials.invalid:
    flow = client.flow_from_clientsecrets(clientsecret_file_path, SCOPE)
    credentials = tools.run_flow(flow, store)


# define API service
http = credentials.authorize(Http())
drive = discovery.build('drive', 'v3', http=http)
sheets = discovery.build('sheets', 'v4', credentials=credentials)


# define a function to retrieve all files
def retrieve_all_files(api_service, filename_to_search):
    results = []
    page_token = None

    while True:
        try:
            param = {'q': 'mimeType="application/vnd.google-apps.spreadsheet"'}

            if page_token:
                param['pageToken'] = page_token

            files = api_service.files().list(**param).execute()# append the files from the current result page to our list
            results.extend(files.get('files'))# Google Drive API shows our files in multiple pages when the number of files exceed 100
            page_token = files.get('nextPageToken')

            if not page_token:
                break

        except errors.HttpError as error:
            print(f'An error has occurred: {error}')
            break# output the file metadata to console
    found = False
    for file in results:
        if file.get('name') == filename_to_search:
            print(file)
            found = True
            break
    if not found:
        return results, None
    return results, file


def download_sheet_to_csv(spreadsheet_id, sheet_name):
    # Call the Sheets API
    result = sheets.spreadsheets().values().get(spreadsheetId=spreadsheet_id, range=sheet_name).execute()

    # Get the values from the result
    values = result.get('values', [])

    # Find the maximum number of columns in the result
    max_columns = max(len(row) for row in values) if values else 0

    # Pad each row with empty values to match the maximum number of columns
    padded_values = [row + [''] * (max_columns - len(row)) for row in values]

    # Output file path
    output_file = f'./_data_csv/{sheet_name}.csv'
    if spreadsheet_name != sheet_name:
        output_file = f'./_data_csv/{spreadsheet_name}_{sheet_name}.csv'

    with open(output_file, 'w', newline='') as f:  # Ensure consistent line endings
        writer = csv.writer(f, delimiter='\t', quoting=csv.QUOTE_MINIMAL)  # Enable quoting
        writer.writerows(padded_values)  # Write padded values to CSV

    print(f'Successfully downloaded {sheet_name}.csv')


# call the function

# Search and make sure that the file exists. 
# This will fail if the file does not exist
all_files, search_file = retrieve_all_files(drive, spreadsheet_name)

# Download the relevant sheet
download_sheet_to_csv(search_file.get('id'), sheet_name)
