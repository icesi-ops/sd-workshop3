#!/bin/bash

# Check if "master" machine is running
if [ "$(vagrant status | grep 'web-1' | awk '{print $2}')" == "running" ]; then
    vagrant ssh web-1 -- -t "( sudo python3 /var/www/python/wsgi.py > /dev/null 2> /dev/null & ); exit"
    sudo ansible-playbook playbooks/consul/haproxy_template.yaml -i ansible_hosts.ini
else
    echo "Consul template ain't ready"
fi