#!/bin/sh

while [ : ]
do
    date=$(date "+%d/%m/%y")
    time=$(date "+%H:%M:%S")

    if pgrep -x "java" >/dev/null
    then
        echo "Server is running!"

        echo "Starting backup on day $date at time $time"

        git add world/ logs/ crash-reports/
        git commit -s -m "$date: Backup of server at $time"
        git push -f
    else
        echo "Server is not running!"
        echo "Skipping backup on day $date at time $time"
    fi
    sleep 1h
done
