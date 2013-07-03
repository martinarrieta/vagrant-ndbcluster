# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :mgmsqlnode do |mgmsqlnode_config|
  	mgmsqlnode_config.vm.box = 'centos6'
  	mgmsqlnode_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
  	mgmsqlnode_config.vm.hostname = 'mgmsqlnode'
  	mgmsqlnode_config.vm.provider :virtualbox do |vb|
  		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60", "--name", "vagrant-mgmsqlnode"] 
  	end
  	mgmsqlnode_config.vm.network :private_network, ip: "192.168.71.101"
  	mgmsqlnode_config.vm.provision :puppet do |mgmsqlnode_puppet|
  		mgmsqlnode_puppet.options = '--verbose --debug'
  		mgmsqlnode_puppet.module_path= "modules"
  	end
  end

  config.vm.define :datanode1 do |datanode1_config|
  	datanode1_config.vm.box = 'centos6'
  	datanode1_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
  	datanode1_config.vm.hostname = 'datanode1'
  	datanode1_config.vm.provider :virtualbox do |vb|
  		vb.customize ["modifyvm", :id, "--memory", "512", "--cpuexecutioncap", "60", "--name", "vagrant-datanode1"] 
  	end
  	datanode1_config.vm.network :private_network, ip: "192.168.71.102"
  	datanode1_config.vm.provision :puppet do |datanode1_puppet|
  		datanode1_puppet.options = '--verbose'
  		datanode1_puppet.module_path= "modules"
  	end
  end

  config.vm.define :datanode2 do |datanode2_config|
  	datanode2_config.vm.box = 'centos6'
  	datanode2_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
  	datanode2_config.vm.hostname = 'datanode2'
  	datanode2_config.vm.provider :virtualbox do |vb|
  		vb.customize ["modifyvm", :id, "--memory", "512", "--cpuexecutioncap", "60", "--name", "vagrant-datanode2"] 
  	end
  	datanode2_config.vm.network :private_network, ip: "192.168.71.103"
  	datanode2_config.vm.provision :puppet do |datanode2_puppet|
  		datanode2_puppet.options = '--verbose'
  		datanode2_puppet.module_path= "modules"
  	end
  end

end
