name 'PROD'
description 'Student Project PROD ENV'
#cookbook OR cookbook_versions  'cookbook' OR 'cookbook' => 'cookbook_version'
#default_attributes 'node' => { 'attribute' => [ 'value', 'value', 'etc.' ] }
default_attributes 'tomcat' => { 
'DBNAME' => 'studentapp',
'DBUSER' => 'studentapp',
'DBPASS' => 'studentapp@1',
'DBIP' => 'studb01'
 }
cookbook_versions  'demo' => '= 0.1.0'
#override_attributes 'node' => { 'attribute' => [ 'value', 'value', 'etc.' ] }
