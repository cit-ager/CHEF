#
# Cookbook:: demo
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#


puts 'Hello World'

#puts "#{node['network']['interfaces']['eth0']}"
puts node['ipaddress']

puts node['demo']['URL']
puts 'Welcome to versioning'

package 'httpd'
