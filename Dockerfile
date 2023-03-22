FROM php:7.2-apache

#remove default index.html
RUN rm -rf /var/www/html/*

# Update and install git
RUN apt-get update && apt-get install git -y 

RUN mkdir -p /home/git

#Script waits for 30 min, Cron did not work well with docker :(
COPY git-sync.sh /home/git/git-sync.sh
RUN chmod +x /home/git/git-sync.sh

# Adding crontab to the appropiate location
#ADD crontab /etc/cron.d/git-sync

# Execute perms for cornjob
#RUN chmod 0644 /etc/cron.d/git-sync

# Running crontab
#RUN crontab /etc/cron.d/git-sync

#ENTRYPOINT ["cron", "-f"]
#CMD ["httpd-foreground"]

COPY start.sh /home/git/start.sh
RUN chmod +x /home/git/start.sh
CMD ["/home/git/start.sh"]
