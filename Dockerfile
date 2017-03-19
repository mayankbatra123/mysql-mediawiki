FROM centos:centos7
MAINTAINER mayankbatra123@gmail.com

RUN yum clean all
RUN yum -y install epel-release
RUN yum -y install PyYAML python-jinja2 python-httplib2
RUN yum -y install python-keyczar python-paramiko
RUN yum -y install python-setuptools git python-pip
RUN yum -y install ansible

RUN yum -y install initscripts

COPY install_mysql.yml /opt/
COPY roles /opt/roles

RUN ansible-playbook -c local /opt/install_mysql.yml

COPY permissions.sh /opt/
RUN  /opt/permissions.sh /var/lib/mysql/ 
RUN  /opt/permissions.sh /var/log/mariadb
RUN  /opt/permissions.sh /var/run

ADD configure.sh /opt
RUN /opt/configure.sh

EXPOSE 22
EXPOSE 3306


