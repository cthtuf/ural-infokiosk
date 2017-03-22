#!/bin/bash
ip=$(dig visitural.info @8.8.8.8 +short)
homepath='/home/dbuser/'
dbuser='dbuser'
dbname='visitural_production'
echo "sync db with ip=$ip"
rsync -Larv kiosk@$ip:visitural_last.bkp.gz $homepath > ${homepath}logs/rsync.db.log 2>&1 &&
gunzip -f ${homepath}visitural_last.bkp.gz &&
pg_restore --verbose --clean --no-acl -U ${dbuser} -d ${dbname} visitural_last.bkp > ${homepath}logs/pg_restore.log 2>&1
