FROM centos:centos7

RUN yum clean all && yum update -y && yum clean all && rpm --rebuilddb
RUN yum install -y java-1.8.0-openjdk
RUN yum clean all

# Set environment variables.
ENV HOME /root
ADD . /build/
WORKDIR /build/
RUN /build/maven-build.sh

# Get the JAR file

# Define working directory.
WORKDIR /var/clamav-rest/

# Open up the server
EXPOSE 8080

ADD bootstrap.sh /
ENTRYPOINT ["/bootstrap.sh"]
