#!/usr/bin/env bash
set -e

echo "========================================="
echo "        SYSTEM DIAGNOSTIC REPORT         "
echo "========================================="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "--- CPU Information ---"
lscpu | grep -E "Model name|Architecture|CPU\(s\)|Thread"
echo ""

echo "--- Memory Status ---"
free -h
echo ""

echo "--- Disk Space Usage ---"
df -h / /mnt 2>/dev/null || df -h
echo ""

echo "--- Active Kernel Version ---"
uname -r
echo "========================================="
