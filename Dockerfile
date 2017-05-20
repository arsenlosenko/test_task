FROM ubuntu

RUN apt-get update && apt-get install -y \
    nginx nginx-extras \
    php-cli php-common php-gd  php-cgi php-fpm php-pear php-mcrypt \
    postgresql postgresql-contrib \
    unzip

ADD phppgadmin.zip /usr/share/
ADD phppgadmin /etc/nginx/sites-available/
ADD nginx.conf /etc/nginx/

RUN unzip /usr/share/phppgadmin.zip; \
    ln -s /etc/nginx/sites-available/phppgadmin /etc/nginx/sites-enabled/; \
    mkdir -p /var/log/phppgadmin ; \
    touch /var/log/phppgadmin/access.log /var/log/phppgadmin/error.log 

CMD ["/etc/init.d/nginx", "start", "&&", "/etc.init.d/php-fpm7.0", "start"]


