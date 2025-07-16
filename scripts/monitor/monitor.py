#!/usr/bin/env python3

#=====================================================
#Script Name: monitor.py
#Description: Prints CPU load and Memory Usage 
#Author: Danish Sajid
#Date: July 16th, 2025
#Usage: ./monitor.py
#=====================================================

import psutil

cpu = psutil.cpu_percent(interval=1)

mem = psutil.virtual_memory()

print(f"CPU Usage: {cpu}%")
print(f"Memory Usage: {mem.percent}% ({mem.used // (1024 ** 2)} MB used {mem.total // (1024 ** 2)} MB)")

