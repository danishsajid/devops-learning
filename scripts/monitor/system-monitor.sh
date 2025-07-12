#!/bin/bash

#System Monitoring Script


LOG_DIR="/var/log/system-monitor"
LOG_FILE="$LOG_DIR/system-monitor.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

#Ensure log directory exists

sudo mkdir -p "$LOG_DIR"
sudo touch "$LOG_FILE"

{
	echo "----- System Monitor Log: $TIMESTAMP -----"
	echo ""
	echo ">> CPU Load (top -bn1 | head -n 5):"
	top -bn1 | head -n 5
	echo ""
	echo ">> Memory Usage (free -h):"
	free -h
	echo ""
	echo ">> Disk Usage (df -h):"
	df -h
	echo ""
	echo "-----------------------------------------"
	echo ""
} | sudo tee -a "$LOG_FILE" > /dev/null
