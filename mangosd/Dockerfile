FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y apt-utils
RUN apt-get install -y libtbb-dev
RUN apt-get install -y openssl
RUN apt-get install -y libssl-dev
RUN apt-get install -y libace-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y php-soap

WORKDIR /opt/vmangos

CMD chmod +x /opt/vmangos/bin/mangosd && bin/mangosd -c /opt/vmangos/etc/mangosd.conf
