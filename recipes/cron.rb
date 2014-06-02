#
# Cookbook Name:: obnam
# Recipe:: cron
#

cron_d 'obnam-backup' do
  minute   '17'
  hour     '*'
  day      '*'
  month    '*'
  weekday  '*'
  command  '/usr/bin/obnam backup --quiet'
  user     'root'
end

cron_d 'obnam-forget' do
  minute   '32'
  hour     '3'
  day      '*'
  month    '*'
  weekday  '0'
  command  '/usr/bin/obnam forget --quiet'
  user     'root'
end
