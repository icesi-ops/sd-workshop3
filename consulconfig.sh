#!/bin/bash

# Vagrant ssh lb
vagrant ssh lb <<EOF
sudo adduser consul
echo "consul" | sudo passwd consul --stdin
sudo chown -R consul:consul /etc/consul
sudo chown -R consul:consul /etc/consul.d/
sudo service firewalld start
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8300/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8500/tcp --permanent
sudo firewall-cmd --reload

su consul <<EOL
nohup consul agent -server -bootstrap-expect=1 -data-dir=/etc/consul/data -node=agent-server -bind=192.168.56.200 -enable-script-checks=true -config-dir= /etc/consul.d -client 0.0.0.0 &
exit
EOL
exit
EOF

# Vagrant ssh web-1
vagrant ssh web-1 <<EOF
sudo adduser consul
echo "consul" | sudo passwd consul --stdin
sudo chown -R consul:consul /etc/consul
sudo chown -R consul:consul /etc/consul.d/
sudo service firewalld start
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --reload
echo "consul" | su - consul <<EOL
cd /etc/consul.d/
echo '{"service": {"name": "web-1", "tags": ["httpd"], "port": 80}}' > web-1.json
nohup consul agent -data-dir=/etc/consul/data -node=$HOSTNAME -bind=192.168.56.11 -enable-script-checks=true -config-dir=/etc/consul.d &
consul join 192.168.56.200
exit
EOL
exit
EOF

# Vagrant ssh lb
vagrant ssh lb <<EOF
cd /etc/consul-template/
sudo wget https://raw.githubusercontent.com/ICESI/ds-discovery-service/master/templates/haproxy.tpl
sudo sed -i 's/microservice-a/web-1/g' /etc/consul-template/haproxy.tpl
sudo consul-template -consul-addr "192.168.56.200:8500" -template "/etc/consul-template/haproxy.tpl:/etc/haproxy.cfg" -once
exit
EOF
