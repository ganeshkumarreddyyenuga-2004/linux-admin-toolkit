#!/bin/bash

LOG_FILE="${1:-}"

if [[ -z "$LOG_FILE" ]]; then
    echo "Usage: $0 /path/to/logfile"
    exit 1
fi

if [[ ! -f "$LOG_FILE" || ! -r "$LOG_FILE" ]]; then
    echo "ERROR: Log file missing or unreadable"
    exit 1
fi

echo "===== LINUX LOG ANALYZER ====="

echo
echo "Log File: $LOG_FILE"

echo
echo "Total Lines:"
wc -l < "$LOG_FILE"

echo
echo "Errors:"
grep -inE 'error|failed|critical' "$LOG_FILE" || true

echo
echo "Warnings:"
grep -inE 'warning|warn' "$LOG_FILE" || true

echo
echo "Log analysis completed"
