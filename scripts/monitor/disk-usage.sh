#!/bin/bash
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
