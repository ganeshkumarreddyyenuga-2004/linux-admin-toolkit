#!/bin/bash

set -u

echo "=================================="
echo " LINUX SYSTEM INFORMATION"
echo "=================================="

echo
echo "Hostname:"
hostname

echo
echo "Operating System:"
grep PRETTY_NAME /etc/os-release

echo
echo "Kernel:"
uname -r

echo
echo "Architecture:"
uname -m

echo
echo "CPU Cores:"
nproc

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h

echo
echo "System Uptime:"
uptime

echo
echo "IP Addresses:"
ip -brief address

echo
echo "System Information Completed"
