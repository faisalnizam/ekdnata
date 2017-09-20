# Create Jenkins Environment 
# Add Maven 
# Add Git 
# Add Java 

# Fetch Image from DockerHub 
FROM ubuntu:16.04

# Install Package 
RUN apt-get update 
RUN apt-get install -y wget

# Install Required Packages 
RUN apt-get -y --force-yes install vim\
 python-dev\
 python-flup\
 python-pip\
 python-ldap\
 expect\
 git\
 pkg-config\
 nodejs


# Setting Some Environment Varianle to Install Java 
ENV java_version 1.8.0_11
ENV filename jdk-8u11-linux-x64.tar.gz
ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/8u11-b12/$filename

# Downloading and Installing Java 
RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/$filename $downloadlink 
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/

# Setting Up Environment Parameters 
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH


# Download and install Latest Maven 
RUN wget --no-verbose -O /tmp/apache-maven-3.5.0.tar.gz   http://www-eu.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
RUN tar xzvf /tmp/apache-maven-3.5.0.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.5.0 /opt/mvn
RUN ln -s /opt/mvn/bin/mvn /usr/local/bin

# Setting Up Environment Home 
ENV MAVEN_HOME /opt/mvn

# Do a Clean 
RUN apt-get clean

# Download and Run Jenkins 

ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]


