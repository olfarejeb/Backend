#!/bin/bash

echo "*** CREATING DATABASE ***"
psql -U  postgres -c "CREATE DATABASE \"gpro\""

file="/docker-entrypoint-initdb.d/gprodb.sql"
dbname=gpro

echo "Restoring DB using $file"
pg_restore -U postgres --dbname=$dbname --verbose --single-transaction < "$file" || exit 1

echo "*** DATABASE CREATED! ***"
