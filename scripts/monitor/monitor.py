#!/usr/bin/env python3

#=====================================================
# Script Name: monitor.py
# Description : Logs CPU, RAM, and Disk usage stats to file periodically
# Author      : Danish Sajid
# Date        : July 19th, 2025
# Usage       : ./monitor.py
#=====================================================

import psutil
import time
import os

def log_cpu():
    return f"CPU Usage: {psutil.cpu_percent()}%"

def log_ram():
    memory = psutil.virtual_memory()
    return f"RAM Usage: {memory.percent}%"

def log_disk():
    disk = psutil.disk_usage('/')
    return f"Disk Usage: {disk.percent}%"

def write_log(file_path=os.path.expanduser("~/Downloads/devops_learning/system_stats.log")):
    with open(file_path, "a") as f:
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
        f.write(f"\n--- {timestamp} ---\n")
        f.write(log_cpu() + "\n")
        f.write(log_ram() + "\n")
        f.write(log_disk() + "\n")
if __name__ == "__main__":
    while True:
        write_log()
        #!/usr/bin/env python3
