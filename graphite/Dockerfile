# Create Graphite Server  
# Add Java 
# Add Necessary Libraries 

# Fetch Image from DockerHub 
FROM ubuntu:16.04


RUN apt-get -y update\
 && apt-get -y upgrade

# dependencies
RUN apt-get -y --force-yes install vim\
 nginx\
 python-dev\
 python-flup\
 python-pip\
 nginx\
 libcairo2\
 libcairo2-dev\
 python-cairo\
 python-rrdtool\
 pkg-config\
 nodejs


# Install Graphite 
RUN git clone -b 0.9.15 --depth 1 https://github.com/graphite-project/graphite-web.git /usr/local/src/graphite-web
WORKDIR /usr/local/src/graphite-web
RUN python ./setup.py install
ADD conf/opt/graphite/conf/*.conf /opt/graphite/conf/
ADD conf/opt/graphite/webapp/graphite/local_settings.py /opt/graphite/webapp/graphite/local_settings.py
ADD conf/opt/graphite/webapp/graphite/app_settings.py /opt/graphite/webapp/graphite/app_settings.py
RUN python /opt/graphite/webapp/graphite/manage.py collectstatic --noinput
ADD conf /etc/graphite-statsd/conf


# Install Statsd Daemon
RUN git clone -b v0.7.2 https://github.com/etsy/statsd.git /opt/statsd
ADD conf/opt/statsd/config.js /opt/statsd/config.js


# Configure NGinx
RUN rm /etc/nginx/sites-enabled/default
ADD conf/etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD conf/etc/nginx/sites-enabled/graphite-statsd.conf /etc/nginx/sites-enabled/graphite-statsd.conf

# Create Logging Support 
RUN mkdir -p /var/log/carbon /var/log/graphite /var/log/nginx
ADD conf/etc/logrotate.d/graphite-statsd /etc/logrotate.d/graphite-statsd


# Expose and Define Persistent Volumes to be attached 
EXPOSE 80 2003-2004 2023-2024 8125/udp 8126
VOLUME ["/opt/graphite/conf", "/opt/graphite/storage", "/etc/nginx", "/opt/statsd", "/etc/logrotate.d", "/var/log"]
WORKDIR /
ENV HOME /root
CMD ["/sbin/my_init"]
