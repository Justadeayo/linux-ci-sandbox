#!/usr/bin/env bash
set -e

SOURCE_DIR="${1:-./configs}"
BACKUP_DIR="${2:-./backups}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="backup_${TIMESTAMP}.tar.zst"

mkdir -p "${BACKUP_DIR}"

if [ ! -d "${SOURCE_DIR}" ]; then
  echo "❌ Source directory '${SOURCE_DIR}' does not exist."
  exit 1
fi

echo "--> Compressing ${SOURCE_DIR} into ${BACKUP_DIR}/${ARCHIVE_NAME}..."
tar -I "zstd -T0 -3" -cf "${BACKUP_DIR}/${ARCHIVE_NAME}" "${SOURCE_DIR}"

echo "--> Cleaning up backups older than 7 days..."
find "${BACKUP_DIR}" -name "backup_*.tar.zst" -mtime +7 -delete

echo "✅ Backup successfully created and rotated."
