

package %w(git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel)

bash 'install_rbenv' do
  user 'vagrant'
  cwd '/home/vagrant'
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  code <<-EOH
    echo $USER
    curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
    rbenv install 2.5.1 && rbenv global 2.5.1
    gem install bundler
    gem install rails -v 5.2.0
    gem install sqlite3
    sudo yum install nodejs -y
    EOH
end

execute 'rehash_rbenv' do
  user 'vagrant'
  cwd '/home/vagrant/.rbenv/bin/'
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  command 'echo $USER && /home/vagrant/.rbenv/bin/rbenv rehash'
  action :run
end



# Try to configure rails autostart

#bash 'rails_start' do
#  user 'vagrant'
#  cwd '/home/shared/ss_trainy/'
#  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
#  code <<-EOH
#    echo $USER
#    cd /home/shared/ss_trainy && rails s
#  EOH
#end
