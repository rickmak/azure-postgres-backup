#!/bin/sh -eu
if [ "${AZURE_STORAGE_ACCOUNT}" = "" ]; then
  echo "You need to set the AZURE_STORAGE_ACCOUNT environment variable."
  exit 1
fi

if [ "${AZURE_STORAGE_KEY}" = "" ]; then
  echo "You need to set the $AZURE_STORAGE_KEY environment variable."
  exit 1
fi

if [ "${AZURE_STORAGE_CONTAINER}" = "" ]; then
  echo "You need to set the AZURE_STORAGE_CONTAINER environment variable."
  exit 1
fi

if [ "${BACKUP_NAME}" = "" ]; then
  BACKUP_NAME = $(date +"%Y-%m-%dT%H:%M:%SZ").sql.gz
fi
echo "Uploading dump.sql.tgs as ${BACKUP_NAME}"

az storage blob upload \
  --container-name $AZURE_STORAGE_CONTAINER \
  --name ${BACKUP_NAME} \
  --file /dump.sql.tgz
