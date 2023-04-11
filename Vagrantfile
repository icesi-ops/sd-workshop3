# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

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
      lb.vm.provision "shell", path: "playbooks/scripts/consulServer.sh"
      lb.vm.provision "shell", path: "playbooks/scripts/basicConfig.sh"
      lb.vm.provision "shell", inline: <<-SHELL 
        consul agent -server -bootstrap-expect=1 -data-dir=/etc/consul/data -node=agent.server -bind=192.168.56.200 -enable-script-checks=true -config-dir=/etc/consul.d -client 0.0.0.0 &
       SHELL
    end
  
    (1..2).each do |i|
     config.vm.define "web-#{i}" do |web|
      node_name = "node#{i}"
      web.vm.box = "centos/7"
      web.vm.hostname = node_name
      web.vm.network "private_network", ip: "192.168.56.1#{i}"
      web.vm.provision "shell", path: "playbooks/scripts/consulAgent.sh"
      web.vm.provision "shell", path: "playbooks/scripts/basicConfig.sh"
      web.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/httpd/webserver.yml"
      ansible.playbook = "playbooks/consul/initAgent.yml"
      ansible.extra_vars = {
        "web": "web-#{i}",
        "agent_dir": "192.168.56.1#{i}",
        "server" => [{"name": "lb", "ip": "192.168.56.200"}]
      }   
      web.vm.provision "shell", inline: <<-SHELL 
        consul agent --data-dir=/etc/consul/data -node=$HOSTNAME -bind=192.168.56.11 -enable-script-checks=true -config-dir=/etc/consul.d &
        consul join 192.168.56.200
      SHELL
      end
     end
    end
  end
