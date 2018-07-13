FROM centos:7

MAINTAINER Sagar Khanna <khanna.sagar@gmail.com>

ENV container docker

RUN yum update --nogpg -y -q && \
yum install --nogpg epel-release sudo wget openssh initscripts git -y -q && \
wget --no-cookies --no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm" \
-O jdk-8u151-linux-x64.rpm && \
sudo rpm -Uvh jdk-8u151-linux-x64.rpm

RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

RUN yum -y install jenkins

RUN yum clean all

ADD scripts /usr/local/bin/scripts
ADD etc/jenkins.sh /usr/local/bin/jenkins.sh

RUN chmod +x /usr/local/bin/scripts/start.sh /usr/local/bin/jenkins.sh && touch /first_run

EXPOSE 8080 22
VOLUME ["/var/lib/jenkins"]

# Kicking in
CMD ["/usr/local/bin/scripts/start.sh"]
