FROM mysql:latest
RUN apt-get update && apt-get install -y cron logrotate vim nano
