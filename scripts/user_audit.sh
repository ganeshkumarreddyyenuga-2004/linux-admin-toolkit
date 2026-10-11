#!/bin/bash

echo "===== LINUX USER AUDIT ====="

echo
echo "Current User:"
whoami

echo
echo "User ID and Groups:"
id

echo
echo "Logged-in Users:"
who

echo
echo "All Local User Accounts:"
cut -d: -f1 /etc/passwd

echo
echo "Users with Home Directories:"
awk -F: '$6 ~ /^\/home\// {print $1, $6}' /etc/passwd

echo
echo "User audit completed"
