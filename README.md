# System Monitoring Dashboard

## Introduction

This is a Bash script that monitors various system resources on a server and displays them in a dashboard format. The script can monitor CPU usage, memory usage, network connections, disk usage, system load, active processes, and essential services. The dashboard refreshes every few seconds to provide real-time insights. Users can also choose to view specific parts of the dashboard using command-line switches.

## Features

- **Top 10 Applications:** Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring:** Shows the number of concurrent connections, packet drops, and MB in/out.
- **Disk Usage:** Displays disk space usage by partitions and highlights partitions using more than 80% of the space.
- **System Load:** Shows the current system load and provides a breakdown of CPU usage.
- **Memory Usage:** Displays total, used, and free memory, along with swap usage.
- **Process Monitoring:** Shows the number of active processes and the top 5 processes by CPU and memory usage.
- **Service Monitoring:** Monitors the status of essential services like `sshd`, `nginx`, and `iptables`.
- **Custom Dashboard:** Allows users to view specific parts of the dashboard using command-line switches like `-cpu`, `-memory`, `-network`, etc.

## Usage

### Running the Script

To run the script, simply execute it from the command line:

```bash
./system_monitor.sh
