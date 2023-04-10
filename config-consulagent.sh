#!/bin/bash

# Vagrant ssh lb
echo "lb configuration"
vagrant ssh lb <<EOF
sudo adduser consul
echo "consul" | sudo passwd consul --stdin
sudo service firewalld start
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8300/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8500/tcp --permanent
sudo firewall-cmd --reload

su consul <<EOL
consul agent -server -boostrap-except=1 -data-direct=/etc/consul/data -node=agent-server -bind=192.168.56.200 -enable-script-checks=true -config-dir=/etc/consul.d -client 0.0.0.0 &
exit
EOL
exit
EOF

echo "web-1 configuration"
# Vagrant ssh web-1
vagrant ssh web-1 <<EOF
sudo adduser consul
echo "consul" | sudo passwd consul --stdin
sudo chown -R consul:consul /etc/consul.d/
sudo service firewalld start
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --reload
exit
EOF

# Vagrant ssh lb
echo "lb configuration 2"
vagrant ssh lb <<EOF
cd /etc/consul-template/
sudo wget https://raw.githubusercontent.com/ICESI/ds-discovery-service/master/templates/haproxy.tpl
sudo consul-template -consul-addr "192.168.56.200:8500" -template "/etc/consul-template/haproxy.tpl:/etc/haproxy.cfg" -once
exit
EOF

# Vagrant ssh web-1
echo "web-1 configuration 2"
vagrant ssh web-1 <<EOF
su consul <<EOL
cd /etc/consul.d/
echo '{"service": {"name": "web-1", "tags": ["httpd"], "port": 80}}' > web-1.json
consul agent--data-dir=/etc/consul/data -node=$HOSTNAME -bind=192.168.56.11 -enable-script-checks=true config-dir=/etc/consul.d
consul join 192.168.56.200
exit
EOL
exit
EOF

# Vagrant ssh lb
echo "lb final configuration"
vagrant ssh lb << EOF
sudo sed -i "s/microservice-a/web-1/g" /etc/consul-template/haproxy.tpl
cat /etc/consul-template/haproxy.tpl
sudo rm /etc/haproxy.cfg
sudo consul-template -consul-addr "192.168.56.200:8500" -template "/etc/consul-template/haproxy.tpl:/etc/haproxy.cfg" -once
exit
EOF
