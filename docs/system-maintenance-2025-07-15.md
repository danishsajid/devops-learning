# Day 11 – Weekend Review and Polish

**Date:** 2025-07-15  
**Goal:** Review and polish all Bash scripts, ensure proper cron scheduling, and verify persistent Flask app hosting on EC2.

---

## Overview

This day focused on organizing and stabilizing all automation components written so far. That included polishing script headers, ensuring they execute safely, verifying the EC2 Flask app remains persistent, and setting up proper log rotation via cron using a privileged root job.

---

## File Structure

```

devops-learning/
├── app/
│   └── app.py
├── docs/
│   ├── app_setup.md
│   ├── ec2_setup.md
│   ├── git-maintenance.md
│   ├── log-rotation.md
│   └── system-monitoring.md
├── README.md
├── scripts/
│   ├── checks/
│   │   └── check-directory.sh
│   ├── info/
│   │   ├── system-info.sh
│   │   └── user-info.sh
│   ├── monitor/
│   │   ├── disk-usage.sh
│   │   ├── network-info.sh
│   │   └── system-monitor.sh
│   └── rotate/
│       ├── system-logrotate.sh
│       └── system-monitor.conf

```

---
## Key Improvements

### Script Header Standardization
- All Bash scripts now include a header block with:
  - Script name
  - Description
  - Author
  - Date
  - Usage example

### Safe Execution with `set -e`
- Each script begins with `set -e` to ensure the script exits immediately on any error.

### Script Testing and Output Verification
- All scripts were run manually to confirm:
  - Proper execution
  - Clean, readable output
  - Error handling works

---

## Flask App Persistence on EC2

- Used `nohup` to keep Flask app running after SSH disconnect:

  `nohup venv/bin/python app.py > flask.log 2>&1 &`

- Confirmed app is accessible via public IP and mobile browser.
- Output is logged in `flask.log`.

---

## Cron Setup

### system-monitor.sh

- Scheduled to run every 5 minutes using the user crontab:

  ```
  */5 * * * * /home/zoya/devops-learning/scripts/monitor/system-monitor.sh
  ```

### system-logrotate.sh

- Moved to root's crontab for proper access to `sudo`:

  ```
  0 */12 * * * /home/zoya/devops-learning/scripts/rotate/system-logrotate.sh
  ```

- Confirmed it runs correctly and logrotate is functioning.

- User crontab cleaned to avoid duplicate execution.

---

## Notes

- Moving to root crontab avoids password prompt issues from `sudo`.
- Verified cron jobs are triggering by checking:

  ```
  grep CRON /var/log/syslog
  ```
- Logs remain clean and organized in `/home/zoya/system-monitor-logs/`.

---

## Outcome

- All Bash scripts are now production-safe and standardized.
- Flask app runs persistently on EC2 using `nohup`.
- Cron jobs function reliably for both monitoring and rotation.
- Repository is fully polished and documented for day 11.

---

**Author:** Danish Sajid
**DevOps Learning Plan – Day 11**
