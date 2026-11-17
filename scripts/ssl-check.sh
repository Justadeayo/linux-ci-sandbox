#!/usr/bin/env bash
set -e

DOMAIN="${1:-github.com}"
PORT="${2:-443}"

echo "Checking TLS certificate for ${DOMAIN}:${PORT}..."

EXPIRY=$(echo | openssl s_client -servername "${DOMAIN}" -connect "${DOMAIN}:${PORT}" 2>/dev/null \
  | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)

if [ -z "${EXPIRY}" ]; then
  echo "❌ Could not retrieve certificate for ${DOMAIN}"
  exit 1
fi

echo "✅ Domain:  ${DOMAIN}"
echo "📅 Expires: ${EXPIRY}"
