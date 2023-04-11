#!/bin/bash

# Check if mongodb database is running
if [ "$(vagrant status | grep 'db' | awk '{print $2}')" == "running" ]; then
    vagrant ssh web-1 -- -t "( sudo python3 /var/www/python/wsgi.py > /dev/null 2> /dev/null & ); exit"
    vagrant ssh web-2 -- -t "( sudo python3 /var/www/python/wsgi.py > /dev/null 2> /dev/null & ); exit"
else
    echo "Mongodb database is not running."
fi