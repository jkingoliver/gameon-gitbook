FROM    node:0.10

MAINTAINER Ben Smith (benjsmi@us.ibm.com)

ADD https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_linux_amd64 /opt/forwarder

ADD ./src/ /opt/docs/

RUN cd /opt/docs/ ; npm install gitbook-cli

COPY ./startup.sh /opt/startup.sh
COPY ./forwarder.conf /opt/forwarder.conf

EXPOSE 4000

CMD ["/opt/startup.sh"]