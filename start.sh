#source ~/.rvm/scripts/rvm &&
cd /home/dbuser/current && ( RAILS_ENV=production /usr/local/rvm/bin/rvm default do bundle exec unicorn -c /home/dbuser/production.rb -E deployment -D )

