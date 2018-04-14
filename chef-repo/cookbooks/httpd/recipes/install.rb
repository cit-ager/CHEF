%w(httpd httpd-devel gcc).each do |pack|
    package "Installing #{pack} Package" do 
        package_name "#{pack}"
        action :install
    end
end


#package %w(httpd httpd-devel gcc) do 
#   action :install 
#end

remote_file 'Downloading ModJK-CONN' do 
    path "#{node['httpd']['TAR']}"
    source "#{node['httpd']['URL']}"
end 

execute 'extract tar file' do 
    command "tar -xf #{node['httpd']['TAR']}"
    cwd '/opt'
end

execute 'Compile MOdJK' do 
    command "./configure --with-apxs=/usr/bin/apxs && make && make install"
    cwd "#{node['httpd']['MODJK_DIR']}/native"
    not_if 'ls -l /etc/httpd/modules/mod_jk.so'
end

%w(mod-jk.conf workers.properties).each do |conffile|
    cookbook_file "Copying #{conffile}" do 
        path "/etc/httpd/conf.d/#{conffile}"
        source "#{conffile}"
    end
end

service "REstarting Web Service" do 
    service_name 'httpd'
    action [ :enable, :restart ]
end




