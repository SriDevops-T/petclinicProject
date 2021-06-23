# this is example about using docker file instructions
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/SriDevops-T/petclinicProject.git
#MAINTAINER stangella9@gmail.com
Label "Name"="SRINIVASA"
#ENTRYPOINT ["echo"]
#CMD ["echo","WELCOME TO DOCKER WORLD"]

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/petclinicProject /app

RUN mvn package
FROM tomcat:7-jre7
ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /user/local/tomcat/conf/

COPY --from=build /app/target/spring-petclinic-4.2.war /usr/local/tomcat/webapps

