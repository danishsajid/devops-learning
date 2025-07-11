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

##  Current Focus
**Week 1: Git mastery and system monitoring scripts**

