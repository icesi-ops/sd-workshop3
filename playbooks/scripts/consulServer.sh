yum install -y unzip
yum install -y wget
wget https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip -P /tmp   
unzip /tmp/consul-template_0.30.0_linux_amd64.zip -d /tmp
mv /tmp/consul-template /usr/bin                         
mkdir /etc/consul-template

wget https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip -P /tmp
unzip /tmp/consul_1.15.1_linux_amd64.zip -d /tmp
mv /tmp/consul /usr/bin
mkdir /etc/consul.d
sudo mkdir -p /etc/consul/data
