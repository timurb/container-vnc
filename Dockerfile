FROM phusion/baseimage
MAINTAINER Timur Batyrshin <erthad@gmail.com>

ADD "scripts/install-vnc.sh" "/install/"
RUN "/install/install-vnc.sh"
ADD "scripts/vnc-user.sh" "/install/"
RUN "/install/vnc-user.sh"
RUN mkdir "/etc/service/vnc-server"
ADD "scripts/run-vnc-server.sh" "/etc/service/vnc-server/run"

RUN apt-get update && apt-get install -y firefox libgl1-mesa-glx
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 5901
ENV DISPLAY :1

ENTRYPOINT ["/sbin/my_init"]
