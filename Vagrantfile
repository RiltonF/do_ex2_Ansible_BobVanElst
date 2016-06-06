Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 384
        v.cpus = 2
    end 
                                            
#    config.vm.define "www1" do |www1|
#        www1.vm.hostname = "www1.dev"
#        www1.vm.network :private_network, ip: "192.168.2.3"
#        www1.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
#        www1.vm.network :forwarded_port, guest: 22, host: 3333, auto_correct: true
#    end

#    config.vm.define "www2" do |www2|
#        www2.vm.hostname = "www2.dev"
#        www2.vm.network :private_network, ip: "192.168.2.4"
#        www2.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
#        www2.vm.network :forwarded_port, guest: 22, host: 4444, auto_correct: true
#    end

    config.vm.define "rp" do |www2|
        www2.vm.hostname = "rp.dev"
        www2.vm.network :private_network, ip: "192.168.2.5"
        www2.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        www2.vm.network :forwarded_port, guest: 22, host: 5555, auto_correct: true
        www2.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
    end

    config.vm.define "mgr" do |mgr|
        mgr.vm.hostname = "mgr.dev"
        mgr.vm.network :private_network, ip: "192.168.2.6"
        mgr.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        mgr.vm.network :forwarded_port, guest: 22, host: 6666, auto_correct: true
#        mgr.vm.provision  "shell", path: "ansible.sh"
  	mgr.vm.provision :ansible do |ansible|
	    ansible.limit = "all"
	    ansible.playbook = "ansible.yml"
	end
    end

    N = 2  #TODO: Autogenerate Host/Inventory file for Ansible
    (1..N).each do |machine_id|
        config.vm.define "www#{machine_id}" do |machine|
            machine.vm.hostname = "www#{machine_id}"
            machine.vm.network "private_network", ip: "192.168.2.#{10+machine_id}"
            machine.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
            machine.vm.network :forwarded_port, guest: 22, host: "#{4000+machine_id}", auto_correct: true
#            machine.vm.provision :ansible do |ansible|
#                ansible.limit = "all"
#                ansible.playbook = "nginx.yml"
#            end
        end
    end


end
