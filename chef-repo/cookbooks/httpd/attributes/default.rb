default['httpd']['URL']='http://redrockdigimark.com/apachemirror/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz'
default['httpd']['tar']="#{default['httpd']['URL']}".split('/').last
default['httpd']['TAR']="/opt/#{default['httpd']['tar']}"
default['httpd']['MODJK_DIR']="#{default['httpd']['TAR']}".gsub('.tar.gz','')