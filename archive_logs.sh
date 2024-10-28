#!/bin/bash

# Define log directory and archive directory
LOG_DIR="/var/logs"
MAIN_DIR="$LOGS_DIR/maintenance"
ARCHIVE_DIR="/hdd/srv/archive/logs"

# Create archive directory if it doesn't exist
#mkdir -p $ARCHIVE_DIR

# Create a zip archive of the logs
LOG_ARCH="$LOG_DIR/system_logs-$(date +\%Y-\%m-\%d)."
tar -j $LOG_ARCH $LOG_DIR/*.log

# Remove the original log files
rm -R $LOG_DIR/*.log
#rm $ALL_LOGS/*.log

# Indicate completion
echo "Logs archived to $LOG_ARCH and original log files removed."
