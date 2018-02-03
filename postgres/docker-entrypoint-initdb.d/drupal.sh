#!/bin/env bash

echo 'Creating User and DB for drupal'
psql -U postgres -c "DROP USER IF EXISTS $DRUPAL_USER"
psql -U postgres -c "CREATE USER  $DRUPAL_USER PASSWORD '$DRUPAL_PASSWORD'"
#psql -U postgres -c "BEGIN\n    IF NOT EXISTS (SELECT * FROM pg_roles WHERE rolname = rolename) THEN\n        EXECUTE format('CREATE ROLE %I', $DRUPAL_USER);\n        RETURN 'CREATE ROLE';\n    ELSE$
psql -U postgres -c "CREATE DATABASE $DRUPAL_DB OWNER $DRUPAL_USER"
echo 'Drupal is ready'

