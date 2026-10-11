# Linux Troubleshooting Guide

## Permission Denied

Check file permissions.

chmod +x scripts/system_info.sh

## Command Not Found

Install the required package and verify PATH.

## Nginx Not Responding

Check Nginx configuration.

sudo nginx -t

Check the service status.

sudo service nginx status

## Network Failure

Check IP addresses.

ip -brief address

Check routing.

ip route

Check DNS.

getent hosts example.com

## Disk Space

Check disk utilization.

df -h

Check directory sizes.

du -sh /var/log
