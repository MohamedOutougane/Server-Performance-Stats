# Server-Performance-Stats
Server performance monitoring script for Linux systems

## How to Use This Repository

If you want to use this repository to monitor your server performance, follow these simple steps:

### Prerequisites
- **Linux System**: The script is designed for Linux environments
- **Bash Shell**: Make sure you have bash available (usually pre-installed on most Linux distributions)
- **Basic System Tools**: The script uses common Linux utilities like `top`, `free`, `df`, etc.

### Steps to Use the Script

1. **Clone this repository**
   ```bash
   git clone https://github.com/MohamedOutougane/Server-Performance-Stats
   cd Server-Performance-Stats
   ```

2. **Make the script executable**
   ```bash
   chmod +x server-stats.sh
   ```

3. **Run the performance monitoring script**
   ```bash
   ./server-stats.sh
   ```
   
   This script will display:
   - CPU usage statistics

### Usage Options
- `./server-stats.sh` - Run basic performance check

---

## Project Development Process

## Project Objective

This project is a DevOps exercise from [roadmap.sh](https://roadmap.sh/projects/server-stats) aimed at creating a comprehensive server performance monitoring script. The goal is to develop a script that can run on any Linux system and provide essential server statistics for system administrators and DevOps engineers.


## Script Features Implementation

### 1. CPU Monitoring
```bash
top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Usage: " 100 - $8 "%"}'
```

**Command breakdown:**

- **`top`**: System monitoring command that displays running processes and system resource usage
- **`-b`**: Batch mode - runs top in non-interactive mode (suitable for scripts)
- **`-n1`**: Number of iterations - runs top only once and exits (instead of continuous updates)
- **`|`**: Pipe operator - passes the output of one command as input to the next command
- **`grep "Cpu(s)"`**: Searches for and extracts only the line containing "Cpu(s)" from top's output
- **`awk`**: Text processing tool for pattern scanning and data extraction
- **`'{print "CPU Usage: " 100 - $8 "%"}'`**: AWK script that:
  - **`$8`**: References the 8th field (column) in the CPU line, which contains the idle percentage
  - **`100 - $8`**: Calculates CPU usage by subtracting idle percentage from 100
  - **`print`**: Outputs the formatted result with "CPU Usage: " prefix and "%" suffix

**Example top output line:**
```
%Cpu(s):  2.3 us,  1.2 sy,  0.0 ni, 96.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
```
In this case, `$8` would be `96.5` (idle), so CPU usage = 100 - 96.5 = 3.5%

### 2. Memory Monitoring
```bash
free -m | awk 'NR==2 {
    used=$3
    total=$2
    printf "Memory Used: %sMB / %sMB (%.2f%%)\n", used, total, used*100/total
}'
```

**Command breakdown:**

- **`free`**: Command that displays amount of free and used memory in the system
- **`-m`**: Display memory values in megabytes (more readable than bytes)
- **`NR==2`**: Selects only the second line of output (which contains actual memory statistics)
- **`used=$3`**: Assigns the 3rd field (used memory) to the variable 'used'
- **`total=$2`**: Assigns the 2nd field (total memory) to the variable 'total'
- **`printf`**: Formats and prints the output with specific formatting
- **`%.2f%%`**: Formats percentage with 2 decimal places
- **`used*100/total`**: Calculates memory usage percentage

**Example free -m output:**
```
              total        used        free      shared  buff/cache   available
Mem:           3944        1250        1180          12        1513        2419
Swap:          2047           0        2047
```
In this case, `$2` (total) = 3944, `$3` (used) = 1250, so usage = 1250/3944 * 100 = 31.69%


### 3. Disk Storage Monitoring
```bash
df -h --total | awk '$1 == "total" {
    print "Disk Used: " $3 " / " $2 " (" $5 ")"
}'
```

**Command breakdown:**

- **`df`**: Reports the amount of disk space used and available on filesystems
- **`-h`**: Human-readable format - shows sizes in KB, MB, GB instead of bytes
- **`--total`**: Includes a summary total line at the end of the output
- **`$1 == "total"`**: Filters output to show only the line where the first field equals "total"
- **`$3`**: References the 3rd field (used space)
- **`$2`**: References the 2nd field (total space)
- **`$5`**: References the 5th field (usage percentage)
- **`print`**: Outputs the formatted result showing used/total space and percentage

**Example df -h --total output:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  8.5G   11G  45% /
/dev/sda2       100G   45G   50G  48% /home
tmpfs           2.0G     0  2.0G   0% /dev/shm
total           122G   54G   63G  47%
```
In this case, the script extracts the "total" line: Used=54G, Total=122G, Percentage=47%
## Issues Encountered and Solutions


## Cross-Platform Compatibility

### Linux Support
- ✅ Primary target platform

## Script Output Examples

### Basic Output
```
========== SERVER PERFORMANCE STATS ==========

--- CPU Usage ---
CPU Usage: 15.2%

```

---
Last update: 20-07-2025
