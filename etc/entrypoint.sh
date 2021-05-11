#!/bin/bash

set -x

# Running java app
java -server \
     -Dserver.port=7087 \
     -jar /home/notification_service/notification-service.jar
