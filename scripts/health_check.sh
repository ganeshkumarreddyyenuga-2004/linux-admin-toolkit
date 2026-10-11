#!/bin/bash

set -u

PROJECT_DIR="$HOME/linux-admin-toolkit"
REPORT_DIR="$PROJECT_DIR/reports"

mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/health_report_$(date +%F_%H-%M-%S).txt"

{
    echo "===== LINUX HEALTH CHECK ====="
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"

    echo
    echo "===== UPTIME ====="
    uptime

    echo
    echo "===== MEMORY ====="
    free -h

    echo
    echo "===== DISK ====="
    df -h

    echo
    echo "===== CPU LOAD ====="
    cat /proc/loadavg

    echo
    echo "===== PROCESS COUNT ====="
    ps -e --no-headers | wc -l

    echo
    echo "===== NETWORK ====="
    ip -brief address

    echo
    echo "===== LISTENING PORTS ====="
    ss -lnt

    echo
    echo "===== DISK WARNINGS ====="

    df -P -x tmpfs -x devtmpfs | awk '
    NR > 1 {
        usage = $5
        gsub(/%/, "", usage)

        if (usage >= 80) {
            print "WARNING: " $6 " usage is " usage "%"
        }
    }'

    echo
    echo "Health check completed"

} > "$REPORT_FILE" 2>&1

echo "Report generated: $REPORT_FILE"
cat "$REPORT_FILE"
