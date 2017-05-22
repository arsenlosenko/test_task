#! /bin/bash

/etc/init.d/postgresql start;
echo "PostgreSQL starting ..."
sleep 40;

echo "Importing data to the database"
python3 /home/test_task/json_import.py;

#sh countryCheck.sh $1

