FROM centos:7

MAINTAINER  Martin Lazarov martin@lazarov.bg

RUN yum install -y git
RUN yum install -y epel-release
RUN yum install -y nginx php-fpm
RUN mkdir -p /var/www/supervisord-monitor/
RUN git clone https://github.com/mlazarov/supervisord-monitor.git /var/www/supervisord-monitor/

ADD supervisor.php /var/www/supervisord-monitor/application/config/supervisor.php

ADD supervisor.conf /etc/nginx/conf.d/supervisor.conf
ADD nginx.conf /etc/nginx/nginx.conf


ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80:80

ENTRYPOINT /run.sh
#CMD /bin/bash
