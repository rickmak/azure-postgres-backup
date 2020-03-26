#!/bin/sh -eu
echo "Dumping the postgre data as SQL"
pg_dump postgres -f /dump/postgres.sql

