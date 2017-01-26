FROM ubuntu:16.04
MAINTAINER Erin Schnabel <schnabel@us.ibm.com> (@ebullientworks)

RUN apt-get -y update

# Install dependencies
RUN apt-get install -y curl git calibre && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
	npm install -g gitbook-cli

# Install latest version
RUN gitbook update
RUN gitbook install

RUN mkdir /gitbook
WORKDIR /gitbook

COPY runGitBookServer.sh /opt/run.sh

EXPOSE 4000

# Live Reload
EXPOSE 35729

CMD ["/opt/run.sh"]
