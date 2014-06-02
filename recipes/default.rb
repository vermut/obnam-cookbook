#
# Cookbook Name:: obnam
# Recipe:: default
#
# Copyright 2014, Pavel Veretennikov
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'obnam-ppa' do
  uri          'http://ppa.launchpad.net/chris-bigballofwax/obnam-ppa/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '57BCA87F'
end

package 'obnam'

ssh_known_hosts_entry node.obnam.backup_host

execute 'create user ssh keys' do
	command '/usr/bin/ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa'
	creates '/root/.ssh/id_rsa'
end

template '/etc/obnam.conf' do
	mode '0600'
	variables(
		:backup_host => node.obnam.backup_host,
		:backup_id => node.obnam.backup_id,
		:backup_targets => node.obnam.backup_targets,
		:keep => node.obnam.keep
	)
end
