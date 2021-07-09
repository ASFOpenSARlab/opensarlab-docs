# Setup a Google Sheet whitelist and a service account

1) goto console.cloud.google.com
1) If you don't have a project yet, click on the project button at the top left of the screen
    1) Click the "New Project" button in th pop-up
    1) create your project
1) Select API & Services from the left menu
    1) Select "Dashboard"
        1) Click the "+ ENABLE APIS AND SERVICES" button at the top of the screen
        1) Search for "Google Sheets API"
            1) Enable it
        1) Search for "Google Drive API"
            1) Enable it
1) From the top left main menu (3 horizontal bars), select "IAM & Admin"
    1) "Service Accounts"
        1) Click the "+ CREATE SERVICE ACCOUNT" button at the top of the screen
            1) Service account name
                1) choose a name
                1) Click "Continue"
            1) Grant this service account access to project
                1) Set the role to basic -> "viewer"
                1) Continue
            1) Grant users access to this service account
                1) skip this
            1) Click the "Done" button
    1) Click on the service account you just created
        1) Select the "KEYS" tab
            1) Select "Create new key" from the "ADD KEY" dropdown
                1) Select json
                1) Click the "CREATE" button
                1) A json credentials file will be automatically downloaded
                    1) This is sensitive information and should be kept confidential
                    1) Move it somewhere
    1) Navigate back to the service account details page
        1) copy the service account email to your clipboard
1) Navigate to Google Sheets
    1) Create a spreadsheet to hold your whitelist
    1) Don't make it public as it will contain sensitive information (names, usernames, email addresses)
    1) Share the sheet with the service account email address as you would share a sheet with a typical human user
        1) Hit the share button and paste in the address
        
        
        
# Extra Notes

* The Google Sheet should follow the naming convention `<deployment_name>-whitelist`
* The first sheet must contain the whitelist
* The first column must contain user emails
* There are no restrictions on the use of additional columns and/or sheets
    * ASF will have access to the sheet so it is recommended that you not include sensitive information 