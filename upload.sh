#!/bin/sh -e
BACKUP_NAME=${BACKUP_NAME}

if [ "${AZURE_STORAGE_ACCOUNT}" = "" ]; then
  echo "You need to set the AZURE_STORAGE_ACCOUNT environment variable."
  exit 1
fi

if [ "${AZURE_STORAGE_KEY}" = "" ]; then
  echo "You need to set the AZURE_STORAGE_KEY environment variable."
  exit 1
fi

if [ "${AZURE_STORAGE_CONTAINER}" = "" ]; then
  echo "You need to set the AZURE_STORAGE_CONTAINER environment variable."
  exit 1
fi

if [ "${BACKUP_NAME}" = "" ]; then
  BACKUP_NAME=$(date +"%Y-%m-%dT%H:%M:%SZ").sql.gz
  if [ "${BACKUP_NAME_SCHEME}" = "WEEK" ]; then
    BACKUP_NAME=WEEKLY-$(date +"%Y-W%W").sql.gz
  fi
  if [ "${BACKUP_NAME_SCHEME}" = "MONTH" ]; then
    BACKUP_NAME=MONTHLY-$(date +"%Y-M%m").sql.gz
  fi
  if [ "${BACKUP_NAME_SCHEME}" = "YEAR" ]; then
    BACKUP_NAME=YEARLY-$(date +"%Y").sql.gz
  fi
fi
echo "Uploading dump.sql.tgs as ${BACKUP_NAME}"

az storage blob upload \
  --container-name $AZURE_STORAGE_CONTAINER \
  --name ${BACKUP_NAME} \
  --file /dump.sql.tgz
