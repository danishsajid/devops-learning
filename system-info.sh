#!/bin/bash
echo "System Information:"
echo "===================="
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Current Date: $(date)"
echo "System Uptime: $(uptime -p)"
echo "Os Information: $(lsb_release -d | cut -f2)"
