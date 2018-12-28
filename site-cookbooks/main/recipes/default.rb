#
# Cookbook:: main
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


package 'ntp' # Install ntpd service

service 'ntpd' do
  action [ :enable, :start ]
end


rbenv_system_install 'system' # Install rbenv
# Install several Rubies to a system wide location

rbenv_ruby '2.5.1' do # Install ruby 2.5.1
  verbose true
end

#rbenv_ruby '2.4.1' do # Install ruby 2.4.1
#  verbose true
#end

#rbenv_ruby '2.3.1' do # Install ruby 2.3.1
#  verbose true
#end

rbenv_global '2.5.1' # Set global ruby

gem_package 'bundler' # Install bundler
package 'nodejs' # Install nodejs
package 'sqlite-devel' # Install sqlite3
gem_package 'rails' do # Install rails 5.2.0
  version '5.2.0'
end

rbenv_rehash 'rehash' # Do rehash after install gems

execute 'bundle_install' do # Do bundle install
  user 'vagrant'
  cwd '/home/shared/'
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  command 'bundle install'
  action :run
end

systemd_unit 'ror.service' do
  content({Unit: {
            Description: 'Run rails',
            Requires: 'network.target',
          },
          Service: {
            Type: 'simple',
	    User: 'vagrant',
	    Group: 'vagrant',
	    WorkingDirectory: '/home/shared',
            ExecStart: '/bin/bash -lc \'bundle exec rails server\'',
            Restart: 'always',
	    TimeoutSec: '60s',
	    RestartSec: '30s',
          },
          Install: {
            WantedBy: 'multi-user.target',
          }})
  action [:create, :enable, :start]
end
