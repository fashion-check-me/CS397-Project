#!/bin/bash

MY_PGCONF="local   all             postgres                                peer
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
"

echo "Creating user: testrole"
sudo -i -u postgres createuser -s -d testrole

if [[ $? -ne 0 ]] ; then
  echo "That didn't work"
  exit $?
fi

MY_PG_PATH='/etc/postgresql/9.3/main/pg_hba.conf'
echo "Checking to make sure $MY_PG_PATH exists..."
if [[ -e "$MY_PG_PATH" ]] ; then
  echo "yep"
else
  echo "nope"
  exit 1
fi

echo "Overwriting Ubuntu's crappy default config with one that's way better"
sudo echo "$MY_PGCONF" > "$MY_PG_PATH"

echo "Restarting postgresql"
sudo service postgresql restart
