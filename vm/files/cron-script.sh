#!/bin/bash

# Create a gzipped sql dump.
/usr/local/bin/drush sql-dump --structure-tables-key=common --root=/var/www/drupal/web --uri=eporama.com  --gzip --result-file=/home/eporama/drush-backups/eporama-$(date +%F).sql >> /home/eporama/cronlogs/db-backups.log

# Send the backup to S3 for safe keeping
s3cmd --no-guess-mime-type put /home/eporama/drush-backups/eporama-$(date +%F).sql.gz s3://eporama
