#!/usr/bin/env bash
set -e

echo "=== Disk Usage Before Cleanup ==="
df -h /

if command -v docker >/dev/null 2>&1; then
  echo "--> Pruning unused Docker containers, networks, images, and build cache..."
  docker system prune -af --volumes
else
  echo "⚠️ Docker is not installed on this host."
fi

echo "=== Disk Usage After Cleanup ==="
df -h /
