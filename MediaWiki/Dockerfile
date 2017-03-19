FROM centos:centos7
MAINTAINER mayankbatra123@gmail.com
ENV container=docker
VOLUME ["/sys/fs/cgroup"]

RUN yum clean all
RUN yum -y install epel-release
RUN yum -y install PyYAML python-jinja2 python-httplib2
RUN yum -y install python-keyczar python-paramiko
RUN yum -y install python-setuptools git python-pip
RUN yum -y install ansible

RUN yum -y install initscripts

COPY mediawiki.yml /opt/
COPY roles /opt/roles

RUN ansible-playbook -c local /opt/mediawiki.yml

COPY configure.sh /opt
RUN /opt/configure.sh

ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]

EXPOSE 22
EXPOSE 80





