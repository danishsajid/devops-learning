# Day 9 – Log Rotation with logrotate

**Date:** 2025-07-13  
**Goal:** Automatically archive and rotate system-monitor logs using `logrotate`.

---

## Overview

To prevent logs from growing indefinitely, `logrotate` was configured to rotate and compress system-monitor logs daily, keeping the last 7 backups. A Bash script was created to manually trigger rotation, and a generic config template was added for reuse.

---

## File Structure

```

devops-learning/
├── scripts/
│   └── rotate/
│       ├── system-logrotate.sh
│       └── system-monitor.conf  # template config
├── docs/
│   └── log-rotation.md

````

---

## Logrotate Configuration Template

**Path:** `scripts/rotate/system-monitor.conf`

```conf
# Replace 'username' with your actual Linux username

su username username

/home/username/system-monitor-logs/system-monitor.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 username username
    olddir /home/username/system-monitor-logs/old
}
````

### Explanation

- `su username username`: Run rotation as the user instead of root.
- `daily`: Rotate logs every day.
- `rotate 7`: Keep 7 previous logs.
- `compress` / `delaycompress`: Compress rotated logs with a delay.
- `olddir`: Move old logs to a subdirectory.
- `notifempty`: Skip if the log is empty.
- `create`: Automatically create a fresh log file with correct permissions.

---

## Manual Rotation Script

**Path:** `scripts/rotate/system-logrotate.sh`

This Bash script triggers logrotate manually using the specified config file.

### Usage

```bash
sudo ./scripts/rotate/system-logrotate.sh
```

### What it does

- Validates the config and log directory exist
- Calls `logrotate` in verbose mode
- Prints a success/failure message

---

## How to Use

1. Copy the template config:

   ```bash
   sudo cp scripts/rotate/system-monitor.conf /etc/logrotate.d/system-monitor
   ```

2. Edit the copied file and replace `username` with your actual Linux username:

   ```bash
   sudo vim /etc/logrotate.d/system-monitor
   ```

3. Make sure the log directory exists:

   ```bash
   mkdir -p ~/system-monitor-logs/old
   ```

4. Trigger a rotation manually to test:

   ```bash
   sudo ./scripts/rotate/system-logrotate.sh
   ```

5. Check that the log was rotated and moved to the `old/` folder.

---

## Outcome

- System-monitor logs are now automatically rotated and compressed.
- Manual script works for testing or use in cron.
- Config file is reusable for other machines with minimal edits.

---

**Author:** Danish Sajid
**DevOps Learning Plan – Day 9**

