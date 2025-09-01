#!/usr/bin/env bash
idle_cpu() { mpstat | awk '/all/ {print $12}' | tail -1; }
usr_cpu() { mpstat | awk '/all/ {print $3}' | tail -1; }
sys_cpu() { mpstat | awk '/all/ {print $5}' | tail -1; }
mem() { free | awk '/Mem/ {print $2}' | tail -1; }
mem_used() { free | awk '/Mem/ {print $3}' | tail -1; }
mem_open() { free | awk '/Mem/ {print $7}' | tail -1; }
conv() { echo "scale=2; $1 / (10^6)" | bc -l; }
> health.logs
echo "Week of $(date)" >> health.logs
echo "current percentage of idle cpu usage: $(idle_cpu) percent" >> health.logs
echo "current percentage of user-level cpu usage: $(usr_cpu) percent" >> health.logs
echo "current percentage of system cpu usage: $(sys_cpu) percent" >> health.logs
echo "Total memory: $(conv $(mem)) GB " >> health.logs
echo "Memory Used: $(conv $(mem_used)) GB " >> health.logs
echo "Memory Left: $(conv $(mem_open)) GB " >> health.logs 
