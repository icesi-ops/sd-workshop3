yum install -y wget
yum install -y unzip
wget https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip -P /tmp
unzip /tmp/consul_1.15.1_linux_amd64.zip -d /tmp
mv /tmp/consul /usr/bin
mkdir /etc/consul.d
mkdir -p /etc/consul/data
