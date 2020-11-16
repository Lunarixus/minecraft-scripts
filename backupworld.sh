#!/bin/sh

count=0

while [ : ]
do
    date=$(date "+%d/%m/%y")
    time=$(date "+%H:%M:%S")

    if pgrep -x "java" >/dev/null
    then
        if [ "$count" -eq "0" ]; then
            then
                echo "Script has been ran for the first time, skipping backup."
            else
                echo "Server is running!"
                echo "Starting backup on day $date at time $time"

                git add world/ logs/ crash-reports/
                git commit -s -m "$date: Backup of server at $time"
                git push -f
        fi
    else
        echo "Server is not running!"
        echo "Skipping backup on day $date at time $time"
    fi
    sleep 1h
done
