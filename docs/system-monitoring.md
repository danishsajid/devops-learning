# Day 10 – Polished System Monitoring Script

**Date:** 2025-07-14  
**Goal:** Refactor and polish the system-monitoring script with better logging, error handling, and portability.

---

## Overview

This task improves the previously written system-monitoring script to be more readable, robust, and user-agnostic. Enhancements include structured output, timestamped sections, colored terminal messages, error handling, and user detection for portability across systems.

---

## File Structure

```

devops-learning/
├── scripts/
│   └── monitor/
│       └── system-monitor.sh
└── docs/
└── system-monitoring.md

```

---

## Script Features

**Path:** `scripts/monitor/system-monitor.sh`

### What it does:
- Logs the following:
  - CPU load using `top`
  - Memory usage using `free -h`
  - Disk usage using `df -h`
- Each section is:
  - Timestamped
  - Clearly separated
  - Indented for easier reading
- Adds color-coded terminal messages (cyan for info, red for errors)
- Includes error handling for each command
- Uses `$(logname)` to dynamically detect the current user's home directory
- Appends output to: `/home/<username>/system-monitor-logs/system-monitor.log`

---

## Manual Usage

1. Make the script executable:
   ```bash
   chmod +x scripts/monitor/system-monitor.sh
````

2. Run it manually:

   ```bash
   ./scripts/monitor/system-monitor.sh
   ```

3. Check the log:

   ```bash
   tail -n 30 /home/$(logname)/system-monitor-logs/system-monitor.log
   ```

---

## Sample Output

```
----- System Monitor Log: 2025-07-14 12:44:32 -----

>> CPU Load (top -bn1 | head -n 5) [2025-07-14 12:44:32]
   top - 12:44:32 up 1 day,  5:12,  1 user,  load average: 0.03, 0.05, 0.00
   Tasks:  95 total,   1 running, 94 sleeping,   0 stopped,   0 zombie
   %Cpu(s):  2.0 us,  1.0 sy,  0.0 ni, 97.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st

>> Memory Usage (free -h) [2025-07-14 12:44:32]
   Mem:           7.7G        2.9G        2.1G         50M        2.7G        4.0G
   Swap:          2.0G          0B        2.0G

>> Disk Usage (df -h) [2025-07-14 12:44:32]
   Filesystem      Size  Used Avail Use% Mounted on
   /dev/sda1        40G   11G   27G  30% /

--------------------------------------------
System monitoring complete at 2025-07-14 12:44:32
```

---

## Notes

- Script uses `$(logname)` to determine the real user, ensuring logs go to the correct home directory even if run via `sudo`.
- Indented output improves readability.
- Timestamped section headers make it easy to track resource usage over time.
- Designed to be cron-compatible:

  - Uses absolute paths
  - No reliance on `sudo`
- Logs are appended, not overwritten.

---

## Outcome

- Script is now more portable, readable, and production-ready.
- Colored terminal output makes manual runs user-friendly.
- Improved logging format is easier to parse or tail in real-time.
- Ready for automation via cron or systemd (if needed in future).

---

**Author:** Danish Sajid
**DevOps Learning Plan – Day 10**

---
