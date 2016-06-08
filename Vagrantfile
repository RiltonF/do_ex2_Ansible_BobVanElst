# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  # create load balancer
  config.vm.define :lb do |lb_config|
      lb_config.vm.box = "ubuntu/trusty64"
      lb_config.vm.hostname = "lb"
      lb_config.vm.network :private_network, ip: "10.0.15.11"
      lb_config.vm.network "forwarded_port", guest: 80, host: 8080
      lb_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  N = 4 
  (1..N).each do |i|
    config.vm.define "web#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "web#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
        if i == N
         # system( ./postVagrant )
          node.vm.provision :ansible do |ansible|
            ansible.limit = "all"
            ansible.playbook = "ansible/ssh-addkey.yml"
#            ansible.verbose = "vvv"
          end
          node.vm.provision :ansible do |ansible|
            ansible.limit = "all"
            ansible.playbook = "ansible/role-site.yml"
#            ansible.verbose = "vvv"
          end
#          node.vm.provision :ansible do |ansible|
#            ansible.limit = "all"
#            ansible.playbook = "ansible/role-rolling-release.yml"
#            ansible.verbose = "vvv"
#          end

        end
    end
  end
end
