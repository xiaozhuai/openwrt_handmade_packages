#!/usr/bin/env bash
set -e

pushd() {
  command pushd "$@" >/dev/null
}

popd() {
  command popd "$@" >/dev/null
}

trim() {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  printf '%s' "$var"
}

pkg_dir="$1"
dist_dir="$2"
echo "- Build ${pkg_dir}"

[ ! -d "${dist_dir}" ] && mkdir -p "${dist_dir}"

pkg_dir="$(realpath "${pkg_dir}")"
dist_dir="$(realpath "${dist_dir}")"

pushd "${pkg_dir}"

while IFS= read -r line; do
  IFS=':'
  read -ra arr <<<"$line"
  key="$(trim "${arr[0]}")"
  val="$(trim "${arr[1]}")"
  echo "  - ${key}: ${val}"
  if [ "${key}" = "Package" ]; then
    pkg_name="${val}"
  elif [ "${key}" = "Version" ]; then
    pkg_version="${val}"
  elif [ "${key}" = "Description" ]; then
    pkg_desc="${val}"
  elif [ "${key}" = "Architecture" ]; then
    pkg_arch="${val}"
  fi
  unset key
  unset val
done <./control/control
unset line

[ -z "${pkg_name}" ] && echo "Field \"Package\" missing in control file" && exit 1
[ -z "${pkg_version}" ] && echo "Field \"Version\" missing in control file" && exit 1
[ -z "${pkg_desc}" ] && echo "Field \"Description\" missing in control file" && exit 1
[ -z "${pkg_arch}" ] && echo "Field \"Architecture\" missing in control file" && exit 1

cache_dir="/tmp/build_cache_${pkg_name}"
if [ -d "${cache_dir}" ]; then
  mkdir -p "${cache_dir}"
else
  rm -rf "${cache_dir}"
  mkdir -p "${cache_dir}"
fi

rm -f "${cache_dir}/debian-binary"
cp -f debian-binary "${cache_dir}"/

pushd "control"
rm -f "${cache_dir}/control.tar.gz"
tar --numeric-owner --group=0 --owner=0 -czf "${cache_dir}/control.tar.gz" ./*
popd

pushd "data"
rm -f "${cache_dir}/data.tar.gz"
tar --numeric-owner --group=0 --owner=0 -czf "${cache_dir}/data.tar.gz" ./*
popd

popd

pushd "${cache_dir}"
rm -f "${dist_dir}/${pkg_name}_${pkg_version}_${pkg_arch}.ipk"
tar --numeric-owner --group=0 --owner=0 -czf "${dist_dir}/${pkg_name}_${pkg_version}_${pkg_arch}.ipk" debian-binary control.tar.gz data.tar.gz
rm debian-binary control.tar.gz data.tar.gz
popd

rm -rf "${cache_dir}"
