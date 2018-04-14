name "demo"
description "The base role for systems that serve HTTP traffic"
run_list "recipe[demo]"
#env_run_lists "prod" => ["recipe[apache2]"], "staging" => ["recipe[apache2::staging]"], "_default" => []
default_attributes "demo" => { "URL" => "role.google.com" }
#override_attributes "apache2" => { "max_children" => "50" }
