#!/bin/sh
set -e

. /etc/lego/env

echo "Suc renew crt for ${LEGO_CERT_DOMAIN}"
echo "LEGO_ACCOUNT_EMAIL : ${LEGO_ACCOUNT_EMAIL}"
echo "LEGO_CERT_DOMAIN   : ${LEGO_CERT_DOMAIN}"
echo "LEGO_CERT_PATH     : ${LEGO_CERT_PATH}"
echo "LEGO_CERT_KEY_PATH : ${LEGO_CERT_KEY_PATH}"

domain_file_name="$(echo "${LEGO_CERT_DOMAIN}" | sed "s/\*/_/g")"
hook_script="${LEGO_PATH}/hooks/${domain_file_name}.sh"
if [ -f "${hook_script}" ]; then
  echo "Run hook script ${hook_script}"
  sh "${hook_script}" renew "${LEGO_CERT_PATH}" "${LEGO_CERT_KEY_PATH}"
else
  echo "Hook script ${hook_script} not found"
fi
