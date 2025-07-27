#!/usr/bin/env python3

#=====================================================
# Script Name: system_monitor.py
# Description : Python version of system-monitor.sh
# Author      : Danish Sajid
#=====================================================

import platform
import psutil
import socket
from datetime import datetime

def get_system_info():
    try:
        print("=== System Information ===")
        print(f"Hostname       : {socket.gethostname()}")
        print(f"OS             : {platform.system()} {platform.release()}")
        print(f"Kernel Version : {platform.version()}")
        print(f"Architecture   : {platform.machine()}")
        uptime_seconds = psutil.boot_time()
        uptime = datetime.now() - datetime.fromtimestamp(uptime_seconds)
        print(f"Uptime         : {str(uptime).split('.')[0]}")
    except Exception as e:
        print(f"[ERROR] Failed to get system info: {e}")

def get_cpu_info():
    try:
        print("\n=== CPU Info ===")
        print(f"Physical Cores : {psutil.cpu_count(logical=False)}")
        print(f"Total Cores    : {psutil.cpu_count(logical=True)}")
        print(f"CPU Usage      : {psutil.cpu_percent(interval=1)}%")
    except Exception as e:
        print(f"[ERROR] Failed to get CPU info: {e}")

def get_memory_info():
    try:
        print("\n=== Memory Info ===")
        mem = psutil.virtual_memory()
        print(f"Total   : {mem.total / (1024**3):.2f} GB")
        print(f"Used    : {mem.used / (1024**3):.2f} GB")
        print(f"Free    : {mem.available / (1024**3):.2f} GB")
        print(f"Usage   : {mem.percent}%")
    except Exception as e:
        print(f"[ERROR] Failed to get memory info: {e}")

def get_disk_info():
    try:
        print("\n=== Disk Info ===")
        for partition in psutil.disk_partitions():
            print(f"\nMountpoint: {partition.mountpoint}")
            try:
                usage = psutil.disk_usage(partition.mountpoint)
                print(f"  Total : {usage.total / (1024**3):.2f} GB")
                print(f"  Used  : {usage.used / (1024**3):.2f} GB")
                print(f"  Free  : {usage.free / (1024**3):.2f} GB")
                print(f"  Usage : {usage.percent}%")
            except PermissionError:
                print("  [Permission Denied]")
    except Exception as e:
        print(f"[ERROR] Failed to get disk info: {e}")

def get_network_info():
    try:
        print("\n=== Network Info ===")
        net_io = psutil.net_io_counters()
        print(f"Bytes Sent   : {net_io.bytes_sent / (1024**2):.2f} MB")
        print(f"Bytes Recv   : {net_io.bytes_recv / (1024**2):.2f} MB")
    except Exception as e:
        print(f"[ERROR] Failed to get network info: {e}")

if __name__ == "__main__":
    get_system_info()
    get_cpu_info()
    get_memory_info()
    get_disk_info()
    get_network_info()

