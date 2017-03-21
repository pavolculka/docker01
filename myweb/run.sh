#!/bin/bash


source /etc/apache2/envvars

if [ -f "$APACHE_PID_FILE" ]; then
	rm "$APACHE_PID_FILE"
fi

/usr/sbin/apache2ctl -D FOREGROUND
