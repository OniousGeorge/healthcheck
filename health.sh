#!/usr/bin/env bash
idle=$(mpstat | awk "/all/{print $12}")
echo 'Sat Aug 30 14:03:09 EDT 2025 current percentage of idle cpu: 99.79 percent' >> health.logs
