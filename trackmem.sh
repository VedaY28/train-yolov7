#!/bin/bash

# Simple memory tracker for time-series logging

log_file="mem_log.csv"
echo "timestamp,ram_used_mb,swap_used_mb" > "$log_file"

while true; do
    timestamp=$(date +%s)
    ram_used=$(free -m | awk '/Mem:/ {print $3}')
    swap_used=$(free -m | awk '/Swap:/ {print $3}')
    echo "$timestamp,$ram_used,$swap_used" >> "$log_file"
    sleep 1
done
