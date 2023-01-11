#!/bin/sh
set -e

. /etc/lego/hook_env

echo "Suc create crt for ${LEGO_CERT_DOMAIN}"
echo "LEGO_ACCOUNT_EMAIL : ${LEGO_ACCOUNT_EMAIL}"
echo "LEGO_CERT_DOMAIN   : ${LEGO_CERT_DOMAIN}"
echo "LEGO_CERT_PATH     : ${LEGO_CERT_PATH}"
echo "LEGO_CERT_KEY_PATH : ${LEGO_CERT_KEY_PATH}"

LEGO_HOOK_SCRIPT="${LEGO_PATH}/hooks/${LEGO_CERT_DOMAIN_FILENAME}_create.sh"
if [ -f "${LEGO_HOOK_SCRIPT}" ]; then
  sh -c "${LEGO_HOOK_SCRIPT}"
else
  echo "Hook script ${LEGO_HOOK_SCRIPT} not found"
fi
