FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    nginx \
    postgresql postgresql-contrib \
    php5-fpm php5-curl php5-gd php5-intl php5-json php5-mcrypt php5-readline php5-pgsql \
    unzip


RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

ADD nginx.conf /etc/nginx/
ADD phppgadmin /etc/nginx/sites-available/
ADD default /etc/nginx/sites-available/
ADD index.html /var/www/html
ADD phppgadmin.tar.gz /usr/share


RUN mkdir -p /var/log/phppgadmin && touch /var/log/phppgadmin/error.log && touch /var/log/phppgadmin/access.log
RUN ln -s /usr/share/phppgadmin /var/www/html; \
    ln -s /etc/nginx/sites-available/phppgadmin /etc/nginx/sites-enabled;

CMD ["service", "nginx", "start", "&&", "service", "php5-fpm", "start", "&&", "service", "postgresql", "start"]

