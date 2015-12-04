#!/bin/bash

if [ "$LOGSTASH_ENDPOINT" != "" ]; then
  echo Starting the logstash forwarder...
  sed -i s/PLACEHOLDER_LOGHOST/$LOGSTASH_ENDPOINT/g /opt/forwarder.conf
  cd /opt
  chmod +x ./forwarder
  echo -e $LOGSTASH_CERT > logstash-forwarder.crt
  echo -e $LOGSTASH_KEY > logstash-forwarder.key
  sleep 0.5
  ./forwarder --config ./forwarder.conf &
  echo "Starting the GitBook Server"
  cd /opt/docs
  node_modules/.bin/gitbook serve
else
  echo "No logging configured; GitBook will log to STDOUT."
  cd /opt/docs
  node_modules/.bin/gitbook serve
fi

