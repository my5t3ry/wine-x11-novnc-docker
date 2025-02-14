FROM ubuntu:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install xvfb x11vnc xdotool  wget tar supervisor net-tools fluxbox  lib32z1 libfreetype6-dev libfreetype6
RUN apt-get update && apt-get -y install lib32stdc++6
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV WINEPREFIX /data/wineprefix/AbletonLive9
ENV WINEARCH win32
ENV DISPLAY :0
RUN mkdir /data/

WORKDIR /root/
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html
RUN wget -O - https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.8.0 /root/novnc/utils/websockify
ADD data /data/




