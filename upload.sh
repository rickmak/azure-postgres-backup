#!/bin/sh -eu
echo "Uploading dump.tgz"
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

az storage blob upload \
  --container-name $AZURE_STORAGE_CONTAINER \
  --name $(date +"%Y-%m-%dT%H:%M:%SZ").sql.gz \
  --file /dump.sql.tgz
