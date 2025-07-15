#!/bin/bash
set -e

#=====================================================
#Script Name: disk-usage.sh
#Description: Outputs Disk Usage, Top 10 largest directories
#             in / and Home directory usage.
#Author: Danish Sajid
#Date: July 5th, 2025
#Usage: ./Disk-Usage.sh
#=====================================================


echo "Disk Usage Information:"
echo "======================="
df -h
echo ""
echo "Top 10 largest directories in /:"
du -sh /* 2>/dev/null | sort -hr | head -10
echo ""
echo "Home directory usage:"
echo "====================="
du -sh ~/* 2>/dev/null | sort -hr | head -10
