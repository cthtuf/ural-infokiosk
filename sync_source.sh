#!/bin/bash
ip=$(dig visitural.info @8.8.8.8 +short) &&
echo "sync source with ip=$ip" &&
rsync -Larv --exclude='current/log' --exclude='current/tmp' kiosk@$ip:current /home/dbuser/ &&
cp bundle_config current/.bundle/config &&
cd ~/current &&
source ~/.rvm/scripts/rvm &&
bundle install &&
ps aux | grep '[u]nicorn' | awk '{print $2}' | xargs kill -9 &&
sleep 3s &&
~/start.sh
