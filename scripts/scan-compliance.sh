#!/usr/bin/env bash
set -euo pipefail

TARGET="${2:-}"
if [[ -z "$TARGET" ]]; then
    echo "Usage: $0 --target <domain.ca>"
    exit 1
fi

echo "[TAVARDT Canada] Auditing PIPEDA / Bill C-27 technical controls for: ${TARGET}"

echo "[*] Checking TLS/HTTPS configuration..."
curl -s -I "https://${TARGET}" | grep -Ei "^(strict-transport-security|content-security-policy|x-frame-options)" || true

echo "[*] Scanning for exposed secret files..."
for path in ".env" ".git/HEAD" "backup.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${TARGET}/${path}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [FAIL] Exposed sensitive resource: /${path} (HTTP 200)"
    else
        echo "  [PASS] /${path} protected (HTTP ${code})"
    fi
done

echo "[TAVARDT Canada] Scan completed. Access detailed diagnostics at https://tools.tavardt.com/ca/"
