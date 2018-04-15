name 'DEV'
description 'Student Project DEV ENV'
#cookbook OR cookbook_versions  'cookbook' OR 'cookbook' => 'cookbook_version'
cookbook_versions  'demo' => '= 0.1.1'
default_attributes 'tomcat' => { 
'DBNAME' => 'studentdev',
'DBUSER' => 'student',
'DBPASS' => 'student@1',
'DBIP' => 'studb01'
 }
#override_attributes 'node' => { 'attribute' => [ 'value', 'value', 'etc.' ] }
