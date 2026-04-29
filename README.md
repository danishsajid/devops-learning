#  DevOps Learning Journey

##  About This Repository
This repository documents my journey to become a DevOps engineer, focusing on automation, cloud deployment, CI/CD, monitoring, and more.

---

## Stack

`Linux` `Bash` `Git` `Docker` `Kubernetes` `Terraform` `GCP` `GitHub Actions` `Prometheus` `Grafana` `Python`

---

## Phases

| Phase | Topic | Status |
|-------|-------|--------|
| 01 | Linux CLI — go deeper | In progress |
| 02 | Bash scripting — properly | Not started |
| 03 | Git workflows — beyond basics | Not started |
| 04 | Networking fundamentals | Not started |
| 05 | Docker and containers | Not started |
| 06 | Python — just enough for DevOps | Not started |
| 07 | Cloud fundamentals with GCP | Not started |
| 08 | Terraform — infrastructure as code | Not started |
| 09 | Kubernetes | Not started |
| 10 | CI/CD pipelines with GitHub Actions | Not started |
| 11 | Monitoring, security, portfolio, jobs | Not started |

---

## Repository Structure

```
scripts/
├── info/         # System information scripts
├── monitor/      # Monitoring and health check scripts
├── checks/       # Validation and check scripts
└── rotate/       # Log rotation scripts
app/              # Application code (Flask, etc.)
docs/             # Documentation and notes per phase
```

---

## Current Phase

**Phase 01 — Linux CLI: go deeper**

Deepening Linux fundamentals — permissions, process management, disk, logs, networking commands, and system monitoring. Building the foundation everything else sits on.

---

<details>
<summary>Previous attempt (2025) - Click to Expand</summary>

> Work done in 2025 following a day-based plan. Included here for continuity.
> The new phase-based work starts from Phase 01 above.

### Day 1 – Git Setup & First Repository
- Set up GitHub and SSH
- Created and cloned first DevOps repo
- Added initial `README.md`

---

### Day 2 – First Commits & Bash Scripting
- Wrote and pushed first two scripts: `system-info.sh` and `disk-usage.sh`
- Practiced `git add`, `commit`, `push`

---

### Day 3 – Git Branching
- Learned `branch`, `checkout`, `merge`, `push origin <branch>`, `cherry-pick`
- Created `network-info.sh` in a separate branch and merged it into main

---

### Day 4 – Bash Scripting & CLI Practice
- Brushed up on Linux CLI basics
- Wrote `user-info.sh` and `check-directory.sh`
- Learned `if` conditionals, argument handling, default values

---

### Day 5 – Git History & Troubleshooting
- `git log`, `git diff`, `git reset`, `git revert`
- Created `.gitignore`, organised scripts into folder structure

---

### Day 6 – EC2 Instance Setup & System Health Check
- Launched Ubuntu 24.04 EC2 instance (t2.micro)
- SSH setup, security groups, system health commands
- Documented in `docs/ec2_setup.md`

---

### Day 7 – Flask Web App Setup on EC2
- Python venv, Flask install, minimal app running on EC2
- Documented in `docs/app_setup.md`

---

### Day 8 – System Monitoring Script with Cron Automation
- `system-monitor.sh` logging CPU, memory, disk
- Cron job running every 5 minutes
- Documented in `docs/system-monitoring.md`

---

### Day 9 – Log Rotation and Script Improvements
- Cron-compatible `system-monitor.sh`
- `system-logrotate.sh` and `system-monitor.conf`
- Documented in `docs/log-rotation.md`

---

### Maintenance – Branch Cleanup & Renaming
- Standardised branch naming to `day*-description` format
- Cleaned stale remote refs
- Documented in `docs/git-maintenance.md`

---

### Day 10 – Script Polish
- Refactored `system-monitor.sh` — dynamic user paths, coloured output, timestamps
- Documented in `docs/system-monitoring.md`

---

### Day 11 – Weekend Review and Polish
- Consistent headers and `set -e` across all scripts
- Flask running persistently with `nohup`
- Logrotate cron moved to root crontab

---

### Day 12 – Python Basics and System Monitor Script
- Python venv, `psutil`, basic monitoring with `monitor.py`
- Documented in `docs/`

---

### Day 13 – Python Functions and Files
- Modular `monitor.py` with CPU, RAM, disk functions
- Logging to file

---

### Day 16 – Rewrite Monitoring Script
- Rewrote `system-monitor.sh` in Python as `system-monitor.py`
- Bash vs Python comparison in `docs/python-sysmonitor.md`

</details>
