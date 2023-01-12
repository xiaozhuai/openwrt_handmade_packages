#!/bin/sh
set -e

ACTION="$1"
CERT_PATH="$2"
CERT_KEY_PATH="$3"

print_usage() {
  echo "Usage: $0 create|renew <cert_path> <cert_key_path>"
}

if [ "${ACTION}" != "create" ] && [ "${ACTION}" != "renew" ]; then
  print_usage
  echo "Unsupport action ${ACTION}"
  exit 1
fi

if [ -z "${CERT_PATH}" ]; then
  print_usage
  echo "Please specify cert_path"
  exit 1
fi

if [ -z "${CERT_KEY_PATH}" ]; then
  print_usage
  echo "Please specify cert_path"
  exit 1
fi

if [ ! -f "${CERT_PATH}" ]; then
  print_usage
  echo "File nou found ${CERT_PATH}"
  exit 1
fi

if [ ! -f "${CERT_KEY_PATH}" ]; then
  print_usage
  echo "File nou found ${CERT_KEY_PATH}"
  exit 1
fi

echo "Update uhttpd config"
uci set uhttpd.main.cert="${CERT_PATH}"
uci set uhttpd.main.key="${CERT_KEY_PATH}"
uci commit uhttpd

if [ "$(/etc/init.d/uhttpd status)" = "running" ]; then
  echo "Restart uhttpd"
  /etc/init.d/uhttpd restart
fi

if [ "$(/etc/init.d/rpcd status)" = "running" ]; then
  echo "Restart rpcd"
  /etc/init.d/rpcd restart
fi
