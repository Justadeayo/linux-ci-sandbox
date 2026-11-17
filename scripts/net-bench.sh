#!/usr/bin/env bash
set -e

TARGET_URL="${1:-https://api.github.com}"

echo "========================================="
echo "        NETWORK LATENCY BENCHMARK        "
echo "========================================="
echo "Target: ${TARGET_URL}"
echo ""

echo "Measuring DNS lookup and connection handshake..."
curl -o /dev/null -s -w "\
  DNS Lookup:     %{time_namelookup}s\n\
  TCP Connect:    %{time_connect}s\n\
  TLS Handshake:  %{time_appconnect}s\n\
  Pre-transfer:   %{time_pretransfer}s\n\
  Start Transfer: %{time_starttransfer}s\n\
  -----------------------------------\n\
  Total Time:     %{time_total}s\n\
  Download Speed: %{speed_download} bytes/sec\n" "${TARGET_URL}"

echo "========================================="
