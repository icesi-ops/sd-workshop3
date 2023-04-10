# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "centos/7"
    nginx.vm.hostname = "sistemasdistribuidos"
    nginx.vm.network "private_network", ip: "192.168.56.199"
    nginx.vm.network "forwarded_port", guest: 80, host: 80
    nginx.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "nginx"]
    end
    nginx.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/nginx/main.yml"
      ansible.groups = {
        "nginx" => ["nginx"]
      }
      ansible.extra_vars = {
        "loadbalancer": "192.168.56.200"
      }
    end
  end

  config.vm.define "lb" do |lb|
    lb.vm.box = "centos/7"
    lb.vm.hostname = "loadbalancer"
    lb.vm.network "private_network", ip: "192.168.56.200"
    lb.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "loadbalancer"]
    end
    lb.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/haproxy/loadbalancer.yml"
      ansible.extra_vars = {
        "web_servers" => [
          {"name": "node-1", "ip": "192.168.56.11"},
          {"name": "node-2", "ip": "192.168.56.12"}
        ]
      }
    end
    lb.vm.provision "shell", inline: <<-SHELL
      yum install -y unzip
      yum install -y wget
      wget https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip -P /tmp
      unzip /tmp/consul-template_0.30.0_linux_amd64.zip -d /tmp
      mv /tmp/consul-template /usr/bin
      mkdir /etc/consul-template
    SHELL

    lb.vm.provision "shell", inline: <<-SHELL
      wget https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip -P /tmp
      unzip /tmp/consul_1.15.1_linux_amd64.zip -d /tmp
      mv /tmp/consul /usr/bin
      mkdir /etc/consul.d
      mkdir -p /etc/consul/data
    SHELL
    
    lb.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "playbooks/consul-agent/ansible_hosts.ini"
    ansible.playbook = "playbooks/consul-agent/consul-server-lb.yaml"
    ansible.verbose = "-v"
    end
  end

  (1..2).each do |i|
   config.vm.define "web-#{i}" do |web|
     web.vm.box = "centos/7"
     web.vm.hostname = "web-#{i}"
     web.vm.network "private_network", ip: "192.168.56.1#{i}"
     web.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1", "--name", "node-#{i}"]
     end
     web.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/httpd/webserver.yml"
      ansible.groups = {
        "webservers" => ["web-#{i}"]
      }
    end
   web.vm.provision "shell", inline: <<-SHELL
      yum install -y unzip
      yum install -y wget
      wget https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip -P /tmp
      unzip /tmp/consul-template_0.30.0_linux_amd64.zip -d /tmp
      mv /tmp/consul-template /usr/bin
      mkdir /etc/consul-template
    SHELL

    web.vm.provision "shell", inline: <<-SHELL
      wget https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip -P /tmp
      unzip /tmp/consul_1.15.1_linux_amd64.zip -d /tmp
      mv /tmp/consul /usr/bin
      mkdir /etc/consul.d
      mkdir -p /etc/consul/data
    SHELL

    web.vm.provision "ansible" do |ansible|
     ansible.playbook = "playbooks/consul-agent/ansible_hosts.ini"
     ansible.playbook = "playbooks/consul-agent/consul-client-nodes.yaml"
     ansible.playbook = "playbooks/consul-agent/consul-haproxycfg.yaml"    
     ansible.verbose = "-v"
    end
   end
  end
end
