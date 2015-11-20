#!/bin/bash



cd /opt/docs

echo "Starting the GitBook Server"
node_modules/.bin/gitbook serve

#echo Running Logstash Forwarder...
#sed -i s/PLACEHOLDER_LOGHOST/$LOGGING_DOCKER_HOST/g /opt/forwarder.conf
#cd /opt ; ./forwarder --config ./forwarder.conf