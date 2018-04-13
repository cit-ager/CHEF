
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
    path "#{node['tomcat']['LOC']}/webapps/student.war"
    source "#{node['tomcat']['WAR']}"
end

remote_file 'Downloading JDBC jar file' do 
    path "#{node['tomcat']['LOC']}/lib/mysql-connector-java-5.1.40.jar"
    source "#{node['tomcat']['JDBC_JAR']}"
    not_if "ls -l #{node['tomcat']['LOC']}/lib/mysql-connector-java-5.1.40.jar"
end

template 'Updating DB Connectors' do
    path "#{node['tomcat']['LOC']}/conf/context.xml"
    source 'context.xml.erb'
    variables(:IPADDRESS => node['ipaddress'])
end

if `ps -ef | grep java | grep -v grep` != ""
    execute 'Shutdown Tomcat' do
        command "#{node['tomcat']['LOC']}/bin/shutdown.sh"
    end
end 

execute 'Start Tomcat' do
    command "#{node['tomcat']['LOC']}/bin/startup.sh"
end
