#!/bin/bash
set -e

#=====================================================
#Script Name: system-logrotate.sh
#Description: This is an Triggers log rotation manually using a
#             custom config from scripts/rotate/.
#             Designed to work with system-monitor.sh
#             for managing logs created by that script.
#Author: Danish Sajid
#Date: July 13th, 2025
#Usage: ./system-logrotate.sh
#=====================================================


# Logrotate Trigger Script for system-monitor logs

CONFIG_FILE="/etc/logrotate.d/system-monitor"
LOG_DIR="$HOME/system-monitor-logs"

echo "[*] Running logrotate for: $CONFIG_FILE"

# Check if config exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "[!] Logrotate config not found at $CONFIG_FILE"
    exit 1
fi

# Check if log directory exists
if [[ ! -d "$LOG_DIR" ]]; then
    echo "[!] Log directory $LOG_DIR not found"
    exit 1
fi

# Run logrotate in verbose mode
sudo logrotate -f -v "$CONFIG_FILE"
EXIT_CODE=$?

if [[ $EXIT_CODE -eq 0 ]]; then
    echo "[✔] Log rotation completed successfully."
else
    echo "[✖] Log rotation failed with exit code $EXIT_CODE."
fi

