package 'Install MariaDB Server' do 
    package_name 'mariadb-server'
    action :install
end

service 'Start MariaDB Service' do
    service_name 'mariadb'
    action :start
end
