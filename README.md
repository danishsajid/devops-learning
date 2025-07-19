#  DevOps Learning Journey

##  About This Repository
This repository documents my 90-day journey to become a DevOps engineer, focusing on automation, cloud deployment, CI/CD, monitoring, and more.

---

##  Goals

- Master Git and version control
- Learn Linux fundamentals and Bash scripting
- Automate tasks using Python
- Understand Docker and build containerized applications
- Learn Kubernetes for container orchestration and scaling
- Create CI/CD pipelines using GitHub Actions
- Deploy applications to cloud platforms (AWS, EC2)
- Use Infrastructure as Code (IaC) with Terraform
- Set up system monitoring with Prometheus and Grafana
- Build centralized logging with ELK Stack (Elasticsearch, Logstash, Kibana)

---

##  Progress

### [x] Day 1 – Git Setup & First Repository
- Set up GitHub and SSH
- Created and cloned first DevOps repo
- Added initial `README.md`

---

### [x] Day 2 – First Commits & Bash Scripting
- Wrote and pushed first two scripts: `system-info.sh` and `disk-usage.sh`
- Practiced `git add`, `commit`, `push`

---

### [x] Day 3 – Git Branching
- Learned:
  - `branch`, `checkout`, `merge`
  - `push origin <branch>`
  - `cherry-pick` to apply specific commits
- Created `network-info.sh` in a separate branch and merged it into main

---

### [x] Day 4 – Bash Scripting & CLI Practice
- Brushed up on Linux CLI basics (`ls`, `cd`, `vim`, `chmod`, etc.)
- Wrote two scripts:
  - `user-info.sh`: Prints user info using env variables like `$USER`, `$HOME`, `$SHELL`
  - `check-directory.sh`: Accepts a directory path and shows number of files, subdirs, total size, and top 5 largest files
- Learned to:
  - Use `if` conditionals, argument handling (`$1`, `${1:-}`), and default values
  - Add professional script headers with metadata

---

### [x] Day 5: Git History & Troubleshooting
- Viewed commit history using `git log --oneline --graph --decorate --all`
- Practiced comparing code changes using `git diff`, `--cached`, and `HEAD`
- Undid commits with `git reset` (soft/hard) and `git revert`
- Created and committed `.gitignore`
- Organized scripts into a proper folder structure:
```
scripts/
├── info/
├── monitor/
└── checks/ 
```

---

### [x] Day 6 – EC2 Instance Setup & System Health Check

- Launched an Ubuntu 24.04 EC2 instance (t2.micro, 8GB EBS) in Stockholm region
- Configured:
  - SSH key pair & security group (allowed port 22 from My IP)
  - Installed updates with `sudo apt update && sudo apt upgrade`
  - Tweaked SSH timeout settings
- Installed Git and cloned existing repo via SSH
- Created a new branch `day6-ec2-setup` for today's work
- Collected and documented system health metrics in `docs/ec2_setup.md`:
  - OS info (`cat /etc/os-release`)
  - Disk usage (`df -h`)
  - Memory stats (`free -m`)
  - Uptime (`uptime`)
  - Top processes (`ps aux --sort=-%cpu | head`)
- Learned basic use of system health commands: `ps`, `top`, `df`, `free`, `uptime`

---

### [x] Day 7 – Flask Web App Setup on EC2

- Used the same EC2 instance from Day 6
- Installed Python venv tools and created a virtual environment:
  - `sudo apt install -y python3-venv`
  - `python3 -m venv venv && source venv/bin/activate`
- Installed Flask inside the virtual environment
- Wrote and committed a minimal Flask app in `app/app.py`:
  - Route `/` returns: `"Hello from Flask on EC2!"`
- Ran the app with: `python app.py`
  - Verified output via `curl` and browser (after opening port 5000 in security group)
- Documented the full setup process in `docs/app_setup.md`
  - Included troubleshooting for PEP 668 and use of virtualenv
- Created feature branches for both code and documentation, pushed, and merged via pull requests

---

### [x] Day 8 – System Monitoring Script with Cron Automation

- Created `scripts/monitor/system-monitor.sh`:
  - Logs CPU (`top`), memory (`free -h`), and disk usage (`df -h`)
  - Appends output to `/var/log/system-monitor/system-monitor.log`
  - Includes timestamp headers for each log entry
- Made the script executable with `chmod +x`
- Manually tested and verified correct log output
- Configured a cron job to run the script every 5 minutes:
  - Used `crontab -e` to add:  
    `*/5 * * * * /absolute/path/to/system-monitor.sh`
- Verified cron automation by inspecting log file growth over time
- Documented the entire process in `docs/system-monitoring.md`
  - Includes script purpose, cron job setup, sample output, and notes
- Used Git to manage everything in `day8` branch and merged via pull request

---

### [x] Day 9 – Log Rotation and Script Improvements

- Improved `system-monitor.sh` for cron compatibility:
  - Removed all `sudo` commands
  - Used `$HOME` for user-specific paths
  - Ensured log directory exists without root privileges
- Confirmed cron job works and logs are updating every 5 minutes
- Documented updated behavior in `docs/system-monitoring.md`

- Created `scripts/rotate/system-logrotate.sh`:
  - Manually triggers log rotation using `logrotate`
  - Prints success or failure with proper exit code check

- Added `scripts/rotate/system-monitor.conf`:
  - Template config for logrotate with user-based ownership
  - Daily rotation, compression, 7 backups, `olddir` structure

- Verified rotation works with:
  - `sudo ./scripts/rotate/system-logrotate.sh`
  - Log files move to `~/system-monitor-logs/old/` and compress

- Documented the entire log rotation process in `docs/log-rotation.md`
- Committed and pushed everything to `day9logrotation` branch via pull request

---

### [x] Maintenance – Branch Cleanup & Renaming

- Renamed earlier feature branches (`feature/*`) to consistent `day*-description` format
- Deleted old branches locally and remotely:
  - Used `git branch -m` to rename
  - Used `git push origin --delete old-branch` and pushed new ones
- Retrieved missing remote branches using:
  - `git fetch origin`
  - `git checkout -b local-name origin/remote-name`
- Cleaned up stale remote refs with:  
  - `git fetch -p`

- Verified branch list with `git branch -a` and `git branch -r`
- Documented the entire process in `docs/git-maintenance.md`

---

### [x] Day 10 – Script Polish

- Refactored `system-monitor.sh` to improve structure and portability:
  - Replaced hardcoded username with `$(logname)` for dynamic user paths
  - Added colored terminal output for section headers and errors
  - Timestamped each section (`CPU`, `Memory`, `Disk`) using `date`
  - Indented log output using `sed 's/^/   /'` for readability
  - Added error handling with success/failure messages for each section
- Ensured logs go to `/home/<user>/system-monitor-logs/system-monitor.log` even when run with `sudo`
- Verified all output is clean and easy to read
- Updated `docs/system-monitoring.md` to reflect all changes
- Committed and pushed to `day10-script-polish` branch via pull request

---

### [x] Day 11 – Weekend Review and Polish

- Reviewed and cleaned all previously written Bash scripts:
  - Added consistent headers with script name, description, author, date, and usage
  - Ensured all scripts include `set -e` for safe execution and error handling
  - Verified that all scripts run correctly and produce clean output
- Confirmed Flask app runs persistently on EC2 using:
  - `nohup venv/bin/python app.py > flask.log 2>&1 &`
  - Verified externally via phone browser
- Moved logrotate cron job to root’s crontab for proper `sudo` access:
  - Scheduled via `0 */12 * * *` to run every 12 hours
- Cleaned up user crontab to remove duplicate logrotate entries
- Verified cron and log rotation pipeline works end-to-end
- Committed and pushed to `day11-weekend-polish` branch via pull request

---

### [x] Day 12 – Python Basics and System Monitor Script

- Set up Python 3 and created a virtual environment (`pyenv`) on EC2
- Installed the `psutil` library inside the venv to collect system stats
- Practiced Python fundamentals using `basics.py`:
  - Variables, strings, `for` and `while` loops
- Wrote `monitor.py` to print:
  - CPU usage (`psutil.cpu_percent(interval=1)`)
  - Memory usage in percent and MB
- Added script metadata headers with:
  - Script name, description, author, date, usage
- Made script executable and confirmed clean terminal output
- Committed and pushed both scripts to `day12-python-basics` branch via pull request

---

### Day 13: Python Functions and Files

- [x] Created `monitor.py` with proper shebang and header
- [x] Wrote modular functions for CPU, RAM, and Disk stats
- [x] Used `psutil`, `time`, and `os` modules for system monitoring
- [x] Logged output to `~/Downloads/devops_learning/system_stats.log`
- [x] Saved script in `/scripts/monitor/`
- [x] Documented the day in `/docs/dayxx-monitor-script.md`

---
##  Current Focus
**Git mastery and system monitoring scripts**

