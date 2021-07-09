FROM tomcat:7-jre7
MAINTAINER "SRINIVAS <hellosrinivas8@gmail.com>
ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf
ADD petclinic.war /usr/local/tomcat/webapps
