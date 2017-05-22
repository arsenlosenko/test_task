#!/bin/bash

/etc/init.d/postgresql start;
sleep 40;

echo "Hello $(whoami)"
if [ "$(whoami)" = 'root' ] || [ "$(whoami)" = 'postgres' ]; then
        if [ $1 = '' ]; then
                psql application -c 'select id as num, nicename, iso3 as iso, numcode, phonecode from country'
        else
                psql application -c "select id as num, nicename, iso3 as iso, numcode, phonecode from country where iso3 = '$1'"
        fi
else
        echo "Plesae be root or postgres to run this script correctly"
fi

