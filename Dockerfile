FROM ubuntu:trusty
MAINTAINER Erin Schnabel

RUN apt-get -y update

# Install dependencies
RUN apt-get install -y curl git calibre && \
	curl -sL https://deb.nodesource.com/setup | bash - && \
	apt-get install -y nodejs && \
	npm install -g gitbook-cli

# Install latest version
RUN gitbook versions:update
RUN gitbook install

RUN mkdir /gitbook
WORKDIR /gitbook

COPY runGitBookServer.sh /opt/run.sh

EXPOSE 4000

CMD ["/opt/run.sh"]
