# Day 13: Python Functions and Files

## Objectives

- Write reusable functions to get CPU, RAM, and disk usage.
- Log the stats to a timestamped file using `psutil` and `time` modules.
- Ensure the script runs continuously and appends logs every 60 seconds.

## Tasks Completed

- [x] Created `monitor.py` in `/scripts/monitor/`.
- [x] Defined `log_cpu()`, `log_ram()`, and `log_disk()` functions.
- [x] Wrote `write_log()` to append to `system_stats.log` every 60 seconds.
- [x] Used `psutil` for system resource info.
- [x] Used `os.path.expanduser()` to resolve `~` in file paths.
- [x] Verified log file creation and entries.
- [x] Added proper script header with metadata.

## File Structure

    /scripts
    └── /monitor
        └── monitor.py
    /docs
    └── dayxx-monitor-script.md

## Success Criteria

- [x] Script runs continuously.
- [x] Logs CPU, RAM, Disk usage with timestamps.
- [x] Output written to `~/Downloads/devops_learning/system_stats.log`.

## Learnings

- How to structure reusable functions in Python.
- Logging to files with timestamps.
- Path handling using `os.path.expanduser()`.
- Using `psutil` for system resource monitoring.

