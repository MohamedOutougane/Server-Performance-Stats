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
