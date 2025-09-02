#!/usr/bin/env bash

#CPU Check Functions

# Checks for what percentage of the CPU is idle
idle_cpu() { mpstat | awk '/all/ {print $12}' | tail -1; }

# Checks for what percentage of the CPU is  used system applications
usr_cpu() { mpstat | awk '/all/ {print $3}' | tail -1; }

# Checks for what percentage of the CPU is used by system Kernel
sys_cpu() { mpstat | awk '/all/ {print $5}' | tail -1; }

#Memory Check Functions

# Checks total memory
mem() { free | awk '/Mem/ {print $2}' | tail -1; }

# Checks used memory
mem_used() { free | awk '/Mem/ {print $3}' | tail -1; }

# Checks how much memory is available
mem_open() { free | awk '/Mem/ {print $7}' | tail -1; }

# Converts KB to GB
conv() { echo "scale=2; $1 / (10^6)" | bc -l; }

# Checks for any available package updates
 checkUp() { apt-get -s upgrade | awk "/Inst/"; }

#Clears any previous log data
> health.logs

# Output Scripts
echo "Week of $(date)" >> health.logs
echo -e "\n" >> health.logs
echo "current percentage of idle cpu usage: $(idle_cpu) percent" >> health.logs
echo "current percentage of user-level cpu usage: $(usr_cpu) percent" >> health.logs
echo "current percentage of system cpu usage: $(sys_cpu) percent" >> health.logs
echo -e "\n" >> health.logs
echo "Total memory: $(conv $(mem)) GB " >> health.logs
echo "Memory Used: $(conv $(mem_used)) GB " >> health.logs
echo "Memory Left: $(conv $(mem_open)) GB " >> health.logs 
echo -e "\n" >> health.logs
echo -e "Available Updates:\n \n$(checkUp)" >> health.logs
