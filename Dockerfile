# Based on
#   - https://github.com/weldpua2008/docker-net-snmp
#   - https://hub.docker.com/r/nuntz/telegraf-snmp/
FROM telegraf

RUN apt-get update
RUN apt-get -y install curl snmp snmpd build-essential libssl-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN rm -r /var/lib/apt/lists/*

EXPOSE 8125/udp 8092/udp 8094

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
