# -*- mode: ruby -*-
# vi: set ft=ruby :


# Installation by Chef_solo using Bash resource

Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
#    config.ssh.username = 'root'
#    config.ssh.password = 'vagrant'
#    config.ssh.insert_key = 'true'
    config.vm.hostname = "testlub4"
    config.vm.define "testlub4"
#    config.vm.network "public_network", bridge: "en0: Ethernet"
#    config.vm.network "forwarded_port", guest: 80, host: 4444
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.provider "virtualbox" do |v|
       v.memory = 2048
       v.cpus = 1
       v.name = "testlub4"
    end
    config.vm.provision "shell", inline: "sudo yum update -y && sudo yum install epel-release -y"
    config.vm.synced_folder "ss_trainee", "/home/shared/"
    config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "tools"  
      chef.cookbooks_path = "cookbooks"
    end  
end


##############################################################################

# Installation by Shell without Chef (example)

=begin
   config.vm.provision "shell", inline: <<-SHELL
     sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
     curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
     echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
     echo 'eval "$(rbenv init -)"' >> ~/.bashrc
     source ~/.bashrc
     rbenv install 2.5.1
     rbenv global 2.5.1
     gem install bundler
     gem install rails -v 5.2.0
     gem install sqlite3
     rbenv rehash
     bundle install
   SHELL
   config.vm.provision "shell", inline: <<-SHELL
     cd /home/shared/prj2 && rails s 
   SHELL
=end    










