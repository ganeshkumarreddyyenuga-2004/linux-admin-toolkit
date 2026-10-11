#!/bin/bash

echo "===== LINUX NETWORK DIAGNOSTICS ====="

echo
echo "===== IP ADDRESSES ====="
ip -brief address

echo
echo "===== ROUTING TABLE ====="
ip route

echo
echo "===== DNS CONFIGURATION ====="
cat /etc/resolv.conf

echo
echo "===== DNS RESOLUTION ====="

if getent hosts example.com >/dev/null 2>&1; then
    echo "DNS resolution successful"
else
    echo "DNS resolution failed"
fi

echo
echo "===== HTTPS CONNECTIVITY ====="

if curl -fsSI --max-time 10 https://example.com >/dev/null 2>&1; then
    echo "HTTPS connectivity successful"
else
    echo "HTTPS connectivity failed"
fi

echo
echo "===== LISTENING TCP PORTS ====="
ss -lnt

echo
echo "Network diagnostics completed"
