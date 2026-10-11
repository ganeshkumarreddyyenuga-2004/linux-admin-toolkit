#!/bin/bash

set -u

PROJECT_DIR="$HOME/linux-admin-toolkit"
REPORT_DIR="$PROJECT_DIR/reports"

mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/disk_report_$(date +%F_%H-%M-%S).txt"

{
    echo "===== LINUX DISK MONITORING ====="
    echo "Date: $(date)"
    echo

    echo "===== DISK USAGE ====="
    df -h

    echo
    echo "===== FILESYSTEM ALERTS ====="

    df -P -x tmpfs -x devtmpfs | awk '
    NR > 1 {
        usage = $5
        gsub(/%/, "", usage)

        if (usage >= 80) {
            print "WARNING: " $6 " usage is " usage "%"
        }
    }'

} | tee "$REPORT_FILE"

echo
echo "Report saved: $REPORT_FILE"
