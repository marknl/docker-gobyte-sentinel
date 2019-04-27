#!/usr/bin/env sh

set -e

if [ ! -f $HOME/gobyte.conf ];
then
  echo "$0: creating sentinel configuration"

cat >$HOME/sentinel/sentinel.conf <<EOL
gobyte_conf=$HOME/gobyte.conf
network=mainnet
db_name=database/sentinel.db
db_driver=sqlite
EOL

  echo "$0: creating gobyte configuration"

cat >$HOME/gobyte.conf <<EOL
rpcuser=$GOBYTE_RPCUSER
rpcpassword=$GOBYTE_RPCPASS
EOL

sed -i "s/127\.0\.0\.1/$GOBYTE_RPCSERVER/" $HOME/sentinel/lib/gobyted.py

fi

echo
exec "$@"
