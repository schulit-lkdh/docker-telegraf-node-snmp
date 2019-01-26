# Based on
#   - https://github.com/weldpua2008/docker-net-snmp
#   - https://hub.docker.com/r/nuntz/telegraf-snmp/
FROM telegraf

RUN apt update
RUN apt -y install curl snmp snmpd snmp-mibs-downloader nodejs nodejs-legacy npm
RUN echo node -v
RUN echo npm -v
RUN rm -r /var/lib/apt/lists/*

EXPOSE 8125/udp 8092/udp 8094

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
