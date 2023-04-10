#!/bin/bash

# Configuración en lb
echo "Configuración usuario lb"
vagrant ssh lb -c "sudo adduser consul"
vagrant ssh lb -c "echo "consul" | sudo passwd consul --stdin"
vagrant ssh lb -c "sudo chown -R consul:consul /etc/consul.d/"
vagrant ssh lb -c "sudo service firewalld start"
vagrant ssh lb -c "sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent"
vagrant ssh lb -c "sudo firewall-cmd --zone=public --add-port=8300/tcp --permanent"
vagrant ssh lb -c "sudo firewall-cmd --zone=public --add-port=8500/tcp --permanent"
vagrant ssh lb -c "sudo firewall-cmd --reload"
vagrant ssh lb -c "su consul -c 'consul agent -server -bootstrap-except=1 -data-dir=/etc/consul/data -node=agent-server -bind=192.168.56.200 -enable-script-checks=true -config-dir=/etc/consul.d -client 0.0.0.0 &'"


# Configuración en web-1
echo "Configuración usuario web-1"
vagrant ssh web-1 -c "sudo adduser consul"
vagrant ssh web-1 -c "echo "consul" | sudo passwd consul --stdin"
vagrant ssh web-1 -c "sudo chown -R consul:consul /etc/consul.d/"
vagrant ssh web-1 -c "sudo service firewalld start"
vagrant ssh web-1 -c "sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent"
vagrant ssh web-1 -c "sudo firewall-cmd --reload"

vagrant ssh web-1 -c "su consul -c 'cd /etc/consul.d/ && echo \"{\\\"service\\\": {\\\"name\\\": \\\"web-1\\\", \\\"tags\\\": [\\\"httpd\\\"], \\\"port\\\": 80}}\" > web-1.json && consul agent --data-dir=/etc/consul/data -node=$HOSTNAME -bind=192.168.56.11 -enable-script-checks=true -config-dir=/etc/consul.d && consul join 192.168.56.200'"

# Configuración en lb
echo "Configuración final en lb"
vagrant ssh lb -c "cd /etc/consul-template/ && sudo wget https://raw.githubusercontent.com/ICESI/ds-discovery-service/master/templates/haproxy.tpl"
vagrant ssh lb -c "sed -i 's/microservice-a/web-1/g' /etc/consul-template/haproxy.tpl"
vagrant ssh lb -c "cat /ect/consul-template/haproxy.tpl"
vagrant ssh lb -c "sudo rm /etc/haproxy.cfg"
vagrant ssh lb -c "sudo consul-template -consul-addr '192.168.56.200:8500' -template '/etc/consul-template/haproxy.tpl:/etc/haproxy.cfg' -once"

