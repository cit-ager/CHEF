
remote_file 'Downloading Tomcat' do 
    path "/opt/#{node['tomcat']['TAR_FILE']}"
    source "#{node['tomcat']['URL']}"
end

execute 'Extracting Tomcat TAR' do
    command "tar -xf /opt/#{node['tomcat']['TAR_FILE']}"
    cwd '/opt'
    not_if "ls -ld #{node['tomcat']['LOC']}"
end

Dir["#{node['tomcat']['LOC']}/webapps/*"].each do |loc|
    if File.file?("#{loc}")
        file "Removing File #{loc}" do
            path "#{loc}"
            action :delete
        end
    elsif File.directory?("#{loc}") 
        directory "Removing Directory #{loc}" do
            path "#{loc}"
            recursive true
            action :delete
        end
    end
end 

remote_file 'Downloading Student War file' do 
    path "/opt/#{node['tomcat']['TAR_FILE']}/webapps/student.war"
    source "#{node['tomcat']['WAR']}"
end

remote_file 'Downloading JDBC jar file' do 
    path "/opt/#{node['tomcat']['TAR_FILE']}/lib/mysql-connector-java-5.1.40.jar"
    source "#{node['tomcat']['WAR']}"
    not_if "ls -l /opt/#{node['tomcat']['TAR_FILE']}/lib/mysql-connector-java-5.1.40.jar"
end
