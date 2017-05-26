#!/bin/bash
if [ "$(whoami)" = 'root' ] || [ "$(whoami)" = 'postgres' ]; then
        if  test -z "$1"
        then
                psql -U postgres application -c 'select id as num, nicename, iso3 as iso, numcode, phonecode from country'
        else
                psql -U postgres application -c "select id as num, nicename, iso3 as iso, numcode, phonecode from country where iso3 = '$1'"
        fi
else
        echo "Plesae be root or postgres to run this script correctly"
fi

