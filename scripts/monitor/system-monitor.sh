#!/bin/bash

#System Monitoring Script
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin/bin

LOG_DIR="/home/$(logname)/system-monitor-logs"
LOG_FILE="$LOG_DIR/system-monitor.log"

# Colors for terminal output
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No color

# Ensure log directory exists
mkdir -p "$LOG_DIR" || {
	echo -e "${RED}[ERROR] Failed to create log directory: $LOG_DIR${NC}"
	exit 1
}
touch "$LOG_FILE" || {
	echo -e "${RED}[ERROR] Failed to access log file: $LOG_FILE${NC}"
	exit 1
}

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Function to log sections with timestamps

log_section() {
	local title=$1
	echo -e "${CYAN}\n>> $title [$TIMESTAMP]${NC}"
	echo "" >> "$LOG_FILE"
	echo ">> $title [$TIMESTAMP]" >> "$LOG_FILE"
}

{
	echo ""
	echo "----- System Monitor Log: $TIMESTAMP -----"
	echo ""
} >> "$LOG_FILE"

# CPU Section
log_section "CPU Load (top -bn1 | head -n 5)"
if { top -bn1 | head -n 5 | sed 's/^/   /'; } >> "$LOG_FILE" 2>&1; then
	echo "[OK] CPU stats collected."
else
	echo -e "${RED}[ERROR] Failed to collect CPU stats.${NC}"
	echo "[ERROR] CPU stats failed." >> "$LOG_FILE"
fi

# Memory Section
log_section "Memory Usage (free -h)"
if { free -h | sed 's/^/   /'; } >> "$LOG_FILE" 2>&1; then
       	echo "[OK] Memory stats collected."
else
       	echo -e "${RED}[ERROR] Failed to collect memory stats.${NC}"
	echo "[ERROR] Memory stats failed." >> "$LOG_FILE"
fi

# Disk Section
log_section "Disk Usage (df -h)"
if { df -h | sed 's/^/   /'; } >> "$LOG_FILE" 2>&1; then
	echo "[OK] Disk stats collected."
else
	echo -e "${RED}[ERROR] Failed to collect disk stats.${NC}"
	echo "[ERROR] Disk stats failed." >> "$LOG_FILE"
fi


echo "--------------------------------------------" >> "$LOG_FILE"
echo -e "\n${CYAN}System monitoring complete at $TIMESTAMP${NC}"

