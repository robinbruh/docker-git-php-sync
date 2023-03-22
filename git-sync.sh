#!/bin/sh
BASH_ENV=container.env
while :
do
	echo "Starting git clone"
	git clone $GIT_REPO /var/www/html/
	echo "Starting git pull"
	cd /var/www/html/
	git pull
	echo "Waiting for 30 minutes"
	sleep 30m
done
