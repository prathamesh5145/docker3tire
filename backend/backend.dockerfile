FROM centos:7
RUN yum install java-11-openjdk -y
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz ./
RUN tar -xzf apache-tomcat-8.5.98.tar.gz -C /opt && \
    rm -rf apache-tomcat-8.5.98.tar.gz
WORKDIR /opt/apache-tomcat-8.5.98.tar.gz 
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-8.5.98.tar.gz/webapps/ && \ 
    https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-8.5.98.tar.gz/lib/mysql-connector.jar  
COPY context.xml conf/context.xml
EXPODE 8080
CMD ["./catalina.sh","run"]
