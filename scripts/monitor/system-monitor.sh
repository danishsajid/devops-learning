#!/bin/bash

#System Monitoring Script
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin/bin

LOG_DIR="/home/zoya/system-monitor-logs"
LOG_FILE="$LOG_DIR/system-monitor.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

#Ensure log directory exists

mkdir -p "$LOG_DIR"
touch "$LOG_FILE"

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
} >> "$LOG_FILE"
