#!/bin/bash

if [ "$LOGGING_DOCKER_HOST" != "" ]; then
  echo Starting the logstash forwarder...
  wget https://admin:$ADMIN_PASSWORD@game-on.org:8443/logstashneeds.tar -O /opt/logstashneeds.tar
  sed -i s/PLACEHOLDER_LOGHOST/$LOGGING_DOCKER_HOST/g /opt/forwarder.conf
  tar xvzf logstashneeds.tar ; rm logstashneeds.tar
  cd /opt ; chmod +x ./forwarder ; tar xvzf logstashneeds.tar ; rm logstashneeds.tar
  ./forwarder --config ./forwarder.conf &
  echo "Starting the GitBook Server"
  cd /opt/docs
  node_modules/.bin/gitbook serve
else
  echo "No logging configured; GitBook will log to STDOUT."
  cd /opt/docs
  node_modules/.bin/gitbook serve
fi

