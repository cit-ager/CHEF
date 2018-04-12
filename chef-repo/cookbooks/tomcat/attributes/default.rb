default['tomcat']['URL']='http://redrockdigimark.com/apachemirror/tomcat/tomcat-9/v9.0.7/bin/apache-tomcat-9.0.7.tar.gz'
default['tomcat']['TAR_FILE']="#{default['tomcat']['URL']}".split('/').last
default['tomcat']['TAR_DIR']="#{default['tomcat']['TAR_FILE']}".gsub('.tar.gz','')
default['tomcat']['LOC']="/opt/#{default['tomcat']['TAR_DIR']}"
default['tomcat']['WAR']='https://github.com/cit-ager/APP-STACK/raw/master/student.war'
default['tomcat']['JDBC_JAR']='https://github.com/cit-ager/APP-STACK/raw/master/mysql-connector-java-5.1.40.jar'
## 
