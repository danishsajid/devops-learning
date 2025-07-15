#!/bin/bash
set -e

#=====================================================
#Script Name: system-info.sh
#Description: Outputs System information, Memory Usage 
#             and Disk Usage.
#Author: Danish Sajid
#Date: July 5th, 2025
#Usage: ./system-info.sh
#=====================================================

echo "System Information:"
echo "===================="
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Current Date: $(date)"
echo "System Uptime: $(uptime -p)"
echo "Os Information: $(lsb_release -d | cut -f2)"
echo ""
echo "Memory Usage:"
echo "$(free -h | head -2)"
echo ""
echo "Disk Usage:"
echo "$(df -h / | tail -1)"

