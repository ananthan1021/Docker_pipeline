FROM tomcat:latest

MAINTAINER Swetha

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

COPY /var/lib/jenkins/workspace/Build_Deploy/target/*.war /usr/local/tomcat/webapps/
CMD chmod +x /usr/local/tomcat/webapps/*.war
