FROM    node:0.10

MAINTAINER Ben Smith (benjsmi@us.ibm.com)

ADD https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_linux_amd64 /opt/forwarder
ADD https://admin:PLACEHOLDER_ADMIN_PASSWORD@game-on.org:8443/logstashneeds.tar /opt/logstashneeds.tar

ADD ./src/ /opt/docs/

RUN cd /opt/docs/ ; npm install gitbook-cli ; node_modules/.bin/gitbook init

#RUN cd /opt ; chmod +x ./forwarder ; tar xvzf logstashneeds.tar ; rm logstashneeds.tar ; \
#	echo "Installing Node modules..." ; cd /opt/room ; npm install 

COPY ./startup.sh /opt/startup.sh

EXPOSE 4000

CMD ["/opt/startup.sh"]