# EC2 Setup Notes - Day 6

## OS Information
```bash
# Output of: cat /etc/os-release 
PRETTY_NAME="Ubuntu 24.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.2 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo

# Output of: df -h
Filesystem       Size  Used Avail Use% Mounted on
/dev/root        6.8G  2.2G  4.6G  33% /
tmpfs            458M     0  458M   0% /dev/shm
tmpfs            183M  904K  182M   1% /run
tmpfs            5.0M     0  5.0M   0% /run/lock
efivarfs         128K  3.6K  120K   3% /sys/firmware/efi/efivars
/dev/nvme0n1p16  881M  148M  672M  18% /boot
/dev/nvme0n1p15  105M  6.2M   99M   6% /boot/efi
tmpfs             92M   12K   92M   1% /run/user/1000

#Output of: free -m
               total        used        free      shared  buff/cache   available
Mem:             914         390         157           2         554         523
Swap:              0           0           0

#Output of:  uptime
 08:38:48 up 46 min,  2 users,  load average: 0.00, 0.00, 0.00

#Output of: ps aux --sort=-%cpu | head -10
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ubuntu     11738  0.1  0.7  14992  7076 ?        S    08:35   0:00 sshd: ubuntu@pts/1
root           1  0.1  1.4  22208 13568 ?        Ss   07:52   0:04 /usr/lib/systemd/systemd --system --deserialize=62
root         614  0.0  3.9 1995852 37072 ?       Ssl  07:52   0:01 /usr/lib/snapd/snapd
ubuntu      1194  0.0  0.7  15004  6952 ?        S    07:55   0:01 sshd: ubuntu@pts/0
root         986  0.0  2.0 1833292 19436 ?       Ssl  07:52   0:01 /snap/amazon-ssm-agent/11320/amazon-ssm-agent
message+     599  0.0  0.6  10020  5632 ?        Ss   07:52   0:00 @dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root         148  0.0  0.0      0     0 ?        I    07:52   0:00 [kworker/u4:3-events_power_efficient]
ubuntu     11739  0.0  0.5   9192  5376 pts/1    Ss   08:35   0:00 -bash
root          10  0.0  0.0      0     0 ?        I    07:52   0:00 [kworker/0:1-events]

