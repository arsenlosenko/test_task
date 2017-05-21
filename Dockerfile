FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    nginx nginx-extras \
    php-cli php-common php-gd  php-cgi php-fpm php-pear php-mcrypt \
    postgresql postgresql-contrib \
    unzip

ADD phppgadmin.zip /usr/share/
ADD phppgadmin /etc/nginx/sites-available/
ADD nginx.conf /etc/nginx/

EXPOSE 5432
EXPOSE 80


RUN unzip /usr/share/phppgadmin.zip; \
    ln -s /etc/nginx/sites-available/phppgadmin /etc/nginx/sites-enabled/; \
    ln -s /usr/share/phppgadmin /var/www/html/; \
    mkdir -p /var/log/phppgadmin ; \
    touch /var/log/phppgadmin/access.log /var/log/phppgadmin/error.log

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf; \
    echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf; \
    service postgresql start && sleep 20; 
    
USER postgres

RUN psql -c "create user support with superuser password 'suppport';" ; \
    createdb application
                                     
#    psql application -c 'create table country(id serial not null primary key, iso char(3) not null, name varchar(80) not null, iso3 char(3) default null, numcode smallint(6) default null, phonecode integer(5) not null);' ;




