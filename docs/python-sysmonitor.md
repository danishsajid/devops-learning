# Bash vs Python Monitoring Script

##  Purpose
To rewrite the original `system-monitor.sh` Bash script in Python (`system-monitor.py`) for better error handling, readability, and modularity — while keeping the output and functionality similar.

---

##  What Each Script Does

| Feature             | Bash Script (`system-monitor.sh`)           | Python Script (`system_monitor.py`)                 |
|---------------------|---------------------------------------------|-----------------------------------------------------|
| Host/System Info    | `hostname`, `uname`, `uptime`               | `socket`, `platform`, `psutil.boot_time()`         |
| CPU Usage           | `lscpu`, `top`, `grep`, `awk`               | `psutil.cpu_count()`, `psutil.cpu_percent()`       |
| Memory Usage        | `free -h`, `awk`                            | `psutil.virtual_memory()`                          |
| Disk Usage          | `df -h`                                     | `psutil.disk_partitions()` + `psutil.disk_usage()` |
| Network Stats       | `ifconfig`, `ip`, `cat /proc/net/dev`       | `psutil.net_io_counters()`                         |
| Error Handling      | Minimal / none                              | Full `try/except` around each section              |
| Output Format       | CLI-friendly                                | Mimics Bash structure with printed sections        |
| Portability         | Unix/Linux only                             | Cross-platform with Python                         |

---

##  Python Code Structure

- `get_system_info()` — Hostname, OS, kernel, uptime
- `get_cpu_info()` — Cores, CPU usage
- `get_memory_info()` — RAM total/used/free
- `get_disk_info()` — All partitions with usage
- `get_network_info()` — Bytes sent/received
- Each function wrapped in `try/except` for fault tolerance
- All output printed cleanly to terminal

---

##  Advantages of Python Version

- More readable and modular code
- Handles errors gracefully (e.g. permission denied)
- No need to rely on external tools like `awk`, `grep`, or `df`
- Easier to extend (e.g. export to JSON, schedule via cron, etc.)
- Cross-platform support (works on macOS and Windows with minor adjustments)

---

##  When to Use Which

- Use **Bash** when:
  - You want a quick one-liner for a terminal script
  - Your environment doesn't have Python or `psutil`
- Use **Python** when:
  - You want maintainable, extendable code
  - You need error handling or reporting
  - You’re integrating monitoring into a larger system

---

##  Learnings

- `psutil` is a powerful and Pythonic way to get system metrics.
- Bash is fast for quick monitoring, but Python gives much more control.
- Writing CLI tools in Python is easy and makes your code future-proof.
- Clean structure and exceptions make Python a better choice for production-grade tools.


