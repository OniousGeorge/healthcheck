#!/usr/bin/env bash
idle_cpu() { mpstat | awk '/all/ {print $12}' | tail -1; }
usr_cpu() { mpstat | awk '/all/ {print $3}' | tail -1; }
sys_cpu() { mpstat | awk '/all/ {print $5}' | tail -1; }
echo "Week of $(date)" >> health.logs
echo "current percentage of idle cpu usage: $(idle_cpu) percent" >> health.logs
echo "current percentage of user-level cpu usage: $(usr_cpu) percent" >> health.logs
echo "current percentage of system cpu usage: $(sys_cpu) percent" >> health.logs
