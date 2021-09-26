
FROM alpine/git as clone
MAINTAINER stangella<stangella9@gmail.com>
WORKDIR /app
RUN git clone https://github.com/SriDevops-T/petclinicProject.git
# stage-two
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone  /app/petclinicProject /app
RUN mvn package
# stage-third
FROM tomcat:7-jre7
ADD settings.xml  /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf
COPY --from=build /app/target/spring-petclinic-4.2.war /usr/local/tomcat/webapps
