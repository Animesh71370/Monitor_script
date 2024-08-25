!/bin/bash
 System Monitoring Dashboard Script

#Display Top 10 Most Used Applications
top_apps() {
  echo "Top 10 Applications by CPU and Memory Usage:"
  ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 11
}

#Monitor Network Connections
network_monitoring() {
  echo "Network Monitoring:"
  echo "Number of concurrent connections:"
  ss -s
  
  echo "Packet drops:"
  netstat -i | grep -E 'RX-ERR|TX-ERR'
  
  echo "MB in/out:"
  ifconfig | grep -E 'RX packets|TX packets'
}

#Monitor Disk Usage
disk_usage() {
  echo "Disk Usage:"
  df -h
  
  echo "Partitions using more than 80%:"
  df -h | awk '$5 > 80 {print $0}'
}

#Monitor System Load
system_load() {
  echo "System Load:"
  uptime
  
  echo "CPU Usage Breakdown:"
  mpstat
}

#Monitor Memory Usage
memory_usage() {
  echo "Memory Usage:"
  free -m
  
  echo "Swap Memory Usage:"
  swapon -s
}

Monitor Active Processes
process_monitoring() {
  echo "Number of Active Processes:"
  ps -e | wc -l
  
  echo "Top 5 Processes by CPU and Memory Usage:"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
}

#Monitor Essential Services
service_monitoring() {
  echo "Service Monitoring:"
  for service in sshd nginx iptables; do
    systemctl is-active --quiet $service && echo "$service is running" || echo "$service is not running"
  done
}
#Custom Dashboard with Command-Line Switches
while getopts ":cpu:memory:network:disk:load:process:service:" opt; do
  case $opt in
    cpu) top_apps ;;
    memory) memory_usage ;;
    network) network_monitoring ;;
    disk) disk_usage ;;
    load) system_load ;;
    process) process_monitoring ;;
    service) service_monitoring ;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done
#Add Real-Time Updates
while true; do
  clear
  top_apps
  network_monitoring
  disk_usage
  system_load
  memory_usage
  process_monitoring
  service_monitoring
  sleep 5
done

