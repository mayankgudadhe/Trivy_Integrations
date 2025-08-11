FROM ubuntu as build
WORKDIR /mnt
RUN apt-get update && apt-get install openjdk-11-jdk maven wget git unzip -y
RUN git clone https://github.com/Shantanumajan6/project.git
WORKDIR /mnt/project
RUN mvn clean install


FROM tomcat:9
EXPOSE 8080
COPY --from=build /mnt/project/target/LoginWebApp.war /usr/local/tomcat/webapps
CMD ["catalina.sh" , "run"]