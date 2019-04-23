#!/usr/bin/env bash                                                                                                                                                                         [0/52]
set -o nounset
set -o pipefail
_CLOUDRON_BACKUP_ROOT=/var/backups
_DATE=$(date -d 'yesterday' +"%Y-%m-%d")

cd ${_CLOUDRON_BACKUP_ROOT}
_DIRNAME=$(find . -name "${_DATE}*" -type d -print -quit)
_LFTP_CMD="set ssl:verify-certificate no ssl; set ftp:ssl-force true; cd Private/backup; mkdir ${_DATE}; cd ${_DATE}; mirror -R ${_DIRNAME} .;exit"

if [[ ! -z "${_DIRNAME}" ]] ; then
  _SUBST_LFTP=$(echo ${_LFTP_CMD} | envsubst '${_DATE} ${_DIRNAME}')
  lftp -u 'REDACTED','REDACTED' -e "${_SUBST_LFTP}" REDACTED
fi
