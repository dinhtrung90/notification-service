FROM adoptopenjdk:11-jre-hotspot

EXPOSE 8087

# Install vim
RUN apt-get update && apt-get install -y vim

# Create user
RUN useradd --create-home notification_service && \
    mkdir -p /home/notification_service/ && \
    mkdir -p /home/notification_service/logs

# Copy file to container
COPY "target/notification-service.jar" "/home/notification_service/notification-service.jar"
COPY "etc/entrypoint.sh" "/home/notification_service/"

# Edit permissions
RUN chown notification_service:notification_service /home/notification_service/* && \
    chmod 700 /home/notification_service/entrypoint.sh

# Change working dir
WORKDIR /home/notification_service

# Entry point
ENTRYPOINT ./entrypoint.sh
