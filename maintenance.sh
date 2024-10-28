#!/bin/bash

# Define log file with a timestamp
LOG_DIR="/var/log"
MAIN_DIR="$LOG_DIR/maintenance"
LOG_FILE="$MAIN_DIR/maintenance-log-$(date +\%Y-\%m-\%d).log"

# Ensure the log directory exists
mkdir -p $MAIN_DIR

# Redirect all output to the log file
exec > $LOG_FILE 2>&1

# Example maintenance tasks
echo "Starting maintenance tasks at $(date)"

# Update package lists
echo "Updating package lists..."
apt-get update

# Upgrade installed packages
echo "Upgrading installed packages..."
apt-get upgrade -y

apt-get clean

# Clean up old packages
echo "Cleaning up old packages..."
apt-get autoremove -y

# Rotate log files
logrotate /etc/logrotate.conf

# Check the file system for errors
fsck -y /dev/sda1

# Check for and remove old backups
#find /backups/* -mtime +30 -exec rm {} \;


# Define the current date and time
#date_time=$(date +%Y-%m-%d_%H-%M-%S)

# Define the filename of the backup
#filename="server_backup_$date_time.tar.gz"

# Create the backup
#tar -zcvf /backup/$filename / --exclude=/backup

# Print confirmation message
#echo "Backup complete. File located at backup/$filename"


# Schedule a reboot
sudo shutdown -r +1 "Rebooting for monthly maintenance"
