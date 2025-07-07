#!/bin/bash

#=====================================================
#Script Name: check-directory.sh
#Description: Gives stats on a directory including
#	      file count, size and largest files.
#Author: Danish Sajid
#Date: July 7th, 2025
#Usage: ./check-directory.sh [optional: /path/to/dir]
#=====================================================

DIR=${1:-$(pwd)}
echo "Directory to check: $DIR"
if [ ! -d "$DIR" ]; then
	echo "Error: '$DIR' is not a valid directory."
	exit 1
fi

echo "Top 5 Largest Files:"
find "$DIR" -type f -exec du -h {} + | sort -hr | head -n 5

