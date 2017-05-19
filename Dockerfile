FROM ubuntu

RUN apt-get update && apt-get install -y \
    nginx nginx-extras \
    php-cli php-common php-gd  php-cgi php-fpm php-pear php-mcrypt \
    postgresql postgresql-contrib \
    unzip

ADD phppgadmin.zip /usr/share/

RUN unzip /usr/share/phppgadmin.zip

CMD ["/etc/init.d/nginx", "start", "&&", "/etc.init.d/php-fpm7.0", "start"]


