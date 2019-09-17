FROM balenalib/raspberry-pi
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y rsyslog libio-socket-ssl-perl apt-utils ddclient && \
    apt-get autoremove --purge && \
    apt-get autoclean && \
    mkdir /config && \
    mv /etc/ddclient.conf /config/ddclient.conf && \
    ln -s /config/ddclient.conf /etc/ddclient.conf
VOLUME /config
CMD service rsyslog start && ddclient -daemon 300 -verbose -syslog && tail -f /var/log/syslog
