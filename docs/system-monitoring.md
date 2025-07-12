# Day 8 – System Monitoring Script with Cron Automation

**Date:** 2025-07-12  
**Goal:** Create a Bash script to monitor system resources (CPU, memory, disk) and automate it using cron.

---

## Overview

This task involved writing a Bash script to collect and log system resource usage, and automating it to run every 5 minutes using a cron job. The script appends output to a log file with timestamps, helping monitor CPU load, memory usage, and disk space over time.

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

## Script Details

**Path:** `scripts/monitor/system-monitor.sh`

### What it does:
- Logs the following:
  - CPU load using `top`
  - Memory usage using `free -h`
  - Disk usage using `df -h`
- Adds a timestamp header
- Appends output to: `/var/log/system-monitor/system-monitor.log`

---

## Manual Usage

1. Make the script executable:
   ```bash
   chmod +x scripts/monitor/system-monitor.sh
   ```

2. Run it manually:
   ```bash
   ./scripts/monitor/system-monitor.sh
   ```

3. Check the output:
   ```bash
   sudo tail -n 30 /var/log/system-monitor/system-monitor.log
   ```

---

## Sample Output

```
----- System Monitor Log: 2025-07-12 10:56:56 -----

>> CPU Load (top -bn1 | head -n 5):
top - 10:56:59 up 4 days, 1 user,  load average: 0.49, 0.39, 0.51
...

>> Memory Usage (free -h):
Mem: 7.6Gi used, 625Mi free
...

>> Disk Usage (df -h):
/dev/sda2   46G   21G   24G  47% /
...
```

---

## Cron Automation

To automate the script, a cron job was added to run it every 5 minutes.

1. Find the full path to the script:
   ```bash
   realpath scripts/monitor/system-monitor.sh
   ```

2. Edit your crontab:
   ```bash
   crontab -e
   ```

3. Add this line to run it every 5 minutes:
   ```cron
   */5 * * * * /home/ubuntu/devops-learning/scripts/monitor/system-monitor.sh
   ```

4. Confirm it's saved:
   ```bash
   crontab -l
   ```

5. After 5–10 minutes, verify logs are updating:
   ```bash
   sudo tail -n 30 /var/log/system-monitor/system-monitor.log
   ```

---

## Notes

- Cron uses a minimal environment, so always use absolute paths.
- The script writes logs to `/var/log/system-monitor/` and may require `sudo` to create or write to that directory.
- Log entries are timestamped, which helps with tracking system performance over time.
- This is a basic form of monitoring. In a real production environment, centralized logging tools would be used instead.

---

## Outcome

- The system-monitoring script works as expected.
- A cron job ensures logs are written automatically every 5 minutes.
- Documentation and scripts committed to the DevOps learning repository.

---

**Author:** Danish Sajid  
**DevOps Learning Plan – Day 8**

