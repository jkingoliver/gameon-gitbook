FROM    nginx

MAINTAINER Ben Smith (benjsmi@us.ibm.com)

ADD https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_linux_amd64 /opt/forwarder
ADD https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz /opt/nodejs.tar.gz

RUN echo "Extracting Node.js..." ; \
	cd /opt ; tar xf nodejs.tar.gz ; \
	export PATH=$PATH:/opt/node-v4.2.3-linux-x64/bin ; \
	echo "Installing gitbook-cli tools..." ; \
	npm install gitbook-cli ; \
	/opt/node_modules/.bin/gitbook install ;\
	ln -s /opt/node-v4.2.3-linux-x64/bin/node /opt/node-v4.2.3-linux-x64/bin/nodejs
	
ADD ./src/ /opt/docs/

RUN export PATH=$PATH:/opt/node-v4.2.3-linux-x64/bin ; cd /opt/docs ; /opt/node_modules/.bin/gitbook build

COPY ./startup.sh /opt/startup.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx-nolog.conf /etc/nginx/nginx-nolog.conf
COPY ./forwarder.conf /opt/forwarder.conf

EXPOSE 8080

CMD ["/opt/startup.sh"]