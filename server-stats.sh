#!/bin/bash

echo "========== SERVER PERFORMANCE STATS =========="

echo -e "\n--- CPU Usage ---"
# top : is a command that provides a dynamic real-time view of the system.
# -b : batch mode operation, useful for sending output to other programs or files.
# -n1 : update the output only once.
# grep : filters the output to show only the line containing "Cpu(s)".
# awk : a programming language that is used for pattern scanning and processing.
top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Usage: " 100 - $8 "%"}'


echo -e "\n--- Memory Usage ---"
# free : displays the amount of free and used memory in the system.
# -m : displays the memory in megabytes.
# NR==2 : selects the second line of the output, which contains memory usage statistics.
free -m | awk 'NR==2 {
    used=$3
    total=$2
    printf "Memory Used: %sMB / %sMB (%.2f%%)\n", used, total, used*100/total
}'


echo -e "\n--- Disk Usage ---"
# df : reports the amount of disk space used and available on filesystems.
# -h : makes the output human-readable, showing sizes in KB, MB, or GB
# --total : includes a total line at the end of the output.
# $1 == "total" : filters the output to show only the total line.
df -h --total | awk '$1 == "total" {
    print "Disk Used: " $3 " / " $2 " (" $5 ")"
}'


echo -e "\n--- Top 5 Processes by CPU Usage ---"
# ps : reports a snapshot of current processes.
# -eo : specifies the output format.
# user : user name of the process owner.
# pid : process ID.
# ppid : parent process ID.
# cmd : command name.
# stime : start time of the process.
# time : cumulative CPU time.
# %cpu : CPU usage percentage.
# %mem : memory usage percentage.
# --sort=-%cpu : sorts the output by CPU usage in descending order.
# head -n 6 : limits the output to the top 5 processes plus the header.
ps -eo user,pid,ppid,cmd,stime,time,%mem,%cpu --sort=-%cpu | head -n 6


echo -e "\n--- Top 5 Processes by Memory Usage ---"
# --sort=-%mem : sorts the output by Memory usage in descending order.
ps -eo user,pid,ppid,cmd,stime,time,%cpu,%mem --sort=-%mem | head -n 6

echo "=============================================="
