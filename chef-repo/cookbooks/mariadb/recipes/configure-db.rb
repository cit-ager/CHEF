cookbook_file 'Copy studentapp.sql file' do
    path '/tmp/studentapp.sql'
    source 'studentapp.sql'
    action :create
end

execute 'Load SQL file into MariaDB database' do
    command 'mysql < /tmp/studentapp.sql'
end
