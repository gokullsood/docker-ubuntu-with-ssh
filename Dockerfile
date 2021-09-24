FROM ubuntu:latest
MAINTAINER Gokul Sood
LABEL version="1.0" location="India" type="centos-with-ssh" 
RUN apt-get update -y;apt install openssh* -y;apt install vim -y;apt install net-tools -y;
RUN echo "PermitRootLogin yes" >>/etc/ssh/sshd_config; service ssh restart;
EXPOSE 22
COPY . /tmp/
RUN chmod +x /tmp/ssh.sh
WORKDIR /root
USER root
ENTRYPOINT //tmp/ssh.sh && /bin/bash
