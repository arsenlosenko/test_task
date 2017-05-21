#!/bin/bash


echo 'Hello $(whoami)'
if ["$(whoami)" = 'root'] || [$EUID = '0']; then
        if [$1 = '']; then
                psql application -c 'select id as num, nicename, iso3 as iso, numcode, phonecode from country'
        else
                psql application -c "select id as num, nicename, iso3 as iso, numcode, phonecode from country where iso3 = '$1'"
        fi
else
        if [$1 = '']; then
                psql application -c 'select id as num, nicename, iso3 as iso, numcode, phonecode from country'
        else
                psql application -c "select id as num, nicename, iso3 as iso, numcode, phonecode from country where iso3 = '$1'"
        fi
fi

