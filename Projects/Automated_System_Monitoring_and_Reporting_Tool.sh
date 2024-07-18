#!/bin/bash

# Function to get CPU usage
get_cpu_usage() {
    cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $cpu%"
}

# Function to get memory usage
get_memory_usage() {
    memory=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $memory%"
}

# Function to get disk usage
get_disk_usage() {
    disk=$(df -h / | awk 'NR==2 {print $5}')
    echo "Disk Usage: $disk"
}

# Function to generate report
generate_report() {
    echo "System Report - $(date)"
    echo "---------------------------"
    get_cpu_usage
    get_memory_usage
    get_disk_usage
    echo "---------------------------"
}

# Main function
main() {
    generate_report
}

# Run the main function
main
