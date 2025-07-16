Absolutely! Here's your Day 12 doc in that same structured format:

---

# Day 12 – Python Basics and System Monitor Script

**Date:** 2025-07-16
**Goal:** Learn Python basics and use `psutil` to create a system resource monitoring script.

---

## Overview

This task introduced core Python concepts like variables, strings, and loops. The day concluded with building a Python-based system monitoring script using the `psutil` library. A virtual environment was used to install dependencies cleanly.

---

## File Structure

```
devops-learning/
├── scripts/
│   ├── basics.py
│   └── monitor/
│       └── monitor.py
└── docs/
    └── day12-python-basics.md
```

---

## Script Features

**Path:** `scripts/monitor/monitor.py`

### What it does:

- Prints system resource usage:
  - **CPU usage** using `psutil.cpu_percent()`
  - **Memory usage** using `psutil.virtual_memory()`
- Displays usage in percentage and human-readable MB values
- Outputs are formatted using Python f-strings for clarity

---

## Manual Usage

1. Activate the virtual environment:

   ```bash
   source ~/pyenv/bin/activate
   ```

2. Make the script executable (if not already):

   ```bash
   chmod +x scripts/monitor/monitor.py
   ```

3. Run the script:

   ```bash
   ./scripts/monitor/monitor.py
   ```

---

## Sample Output

```
CPU Usage: 2.0%
Memory Usage: 41.3% (1683 MB used of 4074 MB)
```

---

## Notes

- `psutil` must be installed inside the virtual environment.
- The script uses a 1-second sample delay for accurate CPU load reporting.
- Includes a structured header block with script metadata.
- A separate script (`basics.py`) was also created to practice loops and strings.

---

## Outcome

- Learned and applied:
  - Python variables, strings, loops (`for`, `while`)
  - Virtual environments and package installation via `pip`
  - Writing and executing Python scripts on a Linux-based EC2 instance
- Script is ready for use in future automation (e.g., cron jobs, alerts).

---

**Author:** Danish Sajid
**DevOps Learning Plan – Day 12**
