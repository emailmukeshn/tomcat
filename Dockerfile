FROM tomcat:8.0
RUN mkdir -p /opt/filebeat \
    && cd /opt/filebeat \
    && wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.3-linux-x86_64.tar.gz \
    && tar -xvzf filebeat-5.6.3-linux-x86_64.tar.gz

COPY filebeat.yml  /opt/filebeat/filebeat-5.6.3-linux-x86_64/
RUN chmod go-w /opt/filebeat/filebeat-5.6.3-linux-x86_64/filebeat.yml
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]
