sudo adduser consul
sudo passwd consul 
sudo chown -R consul:consul /etc/consul
sudo chown -R consul:consul /etc/consul.d/
sudo service firewalld start
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8300/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8500/tcp --permanent
sudo firewall-cmd --reload