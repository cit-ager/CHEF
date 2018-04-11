remote_file 'Downloading Tomcat' do 
    path '/tmp/tomcat.tgz'
    source "#{node['tomcat']['URL']}"
end