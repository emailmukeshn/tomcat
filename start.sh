#!/bin/bash
cd /opt/filebeat/filebeat-5.6.3-linux-x86_64
#Get all Environment variables for filebeat.yml
keys=$(env|grep ^FB_|cut -d= -f1)

#Change list of environment variables from array to string
keys=$( printf "%s" "${keys[@]}" )

#Update values  in filebeat.yml
for key in $keys
do
     value=$(env|grep $key|cut -d= -f2)
     sed -i "s|###${key}###|${value}|g" filebeat.yml
done

./filebeat -c filebeat.yml &
catalina.sh run
