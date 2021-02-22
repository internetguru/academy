#!/bin/bash

declare -r BINPATH="${BINPATH:-/usr/local/bin}"
declare -r SHAREPATH="${SHAREPATH:-/usr/local/share}"
declare -r USRMANPATH="${USRMANPATH:-${SHAREPATH}/man/man1}"
# shellcheck disable=SC2155
declare -r DIR="$(dirname "${BASH_SOURCE[0]}")"

# shellcheck disable=SC1090
. "${DIR}/commons"

check_command go-md2man

declare file
declare fname
for file in "${DIR}/documentation/"*; do
  fname="$(basename "${file}")"
  go-md2man < "${file}" > "${USRMANPATH}/${fname%.*}.1" \
    || exception "Unable to install man page"
done

mandb --create --quiet /usr/local/man/ \
  || exception "Unable to update man database"
