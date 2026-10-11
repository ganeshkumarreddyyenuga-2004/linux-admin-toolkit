#!/bin/bash

set -u

REPORT_DIR="$HOME/linux-admin-toolkit/reports"
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/process_report_$(date +%F_%H-%M-%S).txt"

{
    echo "===== LINUX PROCESS MONITORING ====="
    echo "Date: $(date)"

    echo
    echo "===== TOP CPU PROCESSES ====="
    ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 11

    echo
    echo "===== TOP MEMORY PROCESSES ====="
    ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 11

    echo
    echo "===== PROCESS COUNT ====="
    ps -e --no-headers | wc -l

} | tee "$REPORT_FILE"

echo
echo "Report saved: $REPORT_FILE"
