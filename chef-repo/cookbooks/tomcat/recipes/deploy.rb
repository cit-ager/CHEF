
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

URL_DATA = data_bag_item('deployments', 'prod' )
URL=URL_DATA['url']

remote_file 'Downloading Student War file' do 
    path "#{node['tomcat']['LOC']}/webapps/student.war"
    source URL
end


if `ps -ef | grep java | grep -v grep` != ""
    execute 'Shutdown Tomcat' do
        command "#{node['tomcat']['LOC']}/bin/shutdown.sh"
    end
end 

execute 'Start Tomcat' do
    command "#{node['tomcat']['LOC']}/bin/startup.sh"
end
