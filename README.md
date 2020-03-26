# azure-postgres-backup
Image prepared to backup Azure PostgreSQL database to Microsoft Azure Blob
Storage Container


# Usage

```
docker run \
	-v "${PWD}/dump.sh:/dump.sh" \
	--env PGPASSWORD=${PGPASSWORD} \
	--env PGUSER=${PGUSER} \
	--env PGHOST=${PGHOST} \
	--env AZURE_STORAGE_ACCOUNT=${AZURE_STORAGE_ACCOUNT} \
	--env AZURE_STORAGE_CONTAINER=${AZURE_STORAGE_CONTAINER} \
	--env AZURE_STORAGE_ACCESS_KEY=${AZURE_STORAGE_ACCESS_KEY} \
	--env BACKUP_NAME=${BACKUP_NAME} \
	--rm rickmak/azure-postgres-backup:latest \
```

There is dump.sh, archive.sh and upload.sh for customization.

For example, if you would like to backup two database override the dump.sh
