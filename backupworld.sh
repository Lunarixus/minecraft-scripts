#!/bin/sh

count=0

# Start while loop for backups
while [ : ]
do
    # Store date and time in variables
    date=$(date "+%d/%m/%y")
    time=$(date "+%H:%M:%S")

    # Check for instance of java running
    if pgrep -x "java" >/dev/null
    then
        # Skip backup if script has just been ran
        if [ "$count" -eq "0" ]; then
            then
                echo "Script has been ran for the first time, skipping backup."
		((count=count+1))
            else
                echo "Server is running!"
                echo "Starting backup on day $date at time $time"

		# Push world, logs and crash reports to git
                git add world/ logs/ crash-reports/
                git commit -s -m "$date: Backup of server at $time"
                git push -f
        fi
    else
	# Abort if java instance isn't found
        echo "Server is not running!"
        echo "Skipping backup on day $date at time $time"
    fi
    # Sleep for 1 hour
    sleep 1h
done
