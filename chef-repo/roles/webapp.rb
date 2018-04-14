name "webapp"
description "Install Web Server + App Server"
run_list "recipe[tomcat::install-java]", "recipe[tomcat::install]", "recipe[httpd::install]"
#env_run_lists "prod" => ["recipe[apache2]"], "staging" => ["recipe[apache2::staging]"], "_default" => []
#default_attributes "apache2" => { "listen_ports" => [ "80", "443" ] }
#override_attributes "apache2" => { "max_children" => "50" }
