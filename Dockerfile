FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    nginx \
    postgresql postgresql-contrib \
    php5-fpm php5-curl php5-gd php5-intl php5-json php5-mcrypt php5-readline php5-pgsql \
    unzip \
    python3 \
    vim

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

ADD nginx.conf /etc/nginx/
ADD phppgadmin /etc/nginx/sites-available/
ADD default /etc/nginx/sites-available/
ADD index.html /var/www/html
ADD phppgadmin.tar.gz /usr/share

RUN useradd -p support support

USER postgres
RUN /etc/init.d/postgresql start \
    && psql -c "create user support with superuser password 'support';" \
    && createdb -O support application  \
    && psql application -c "create table country(id serial not null primary key, iso char(2) not null, name varchar(80) not null,nicename varchar(80) not null, iso3 char(3) default null, numcode varchar(6) default null, phonecode varchar(5) not null);";


USER root 
RUN mkdir -p /var/log/phppgadmin && touch /var/log/phppgadmin/error.log && touch /var/log/phppgadmin/access.log
RUN ln -s /usr/share/phppgadmin /var/www/html; \
    ln -s /etc/nginx/sites-available/phppgadmin /etc/nginx/sites-enabled;
RUN echo listen_addresses=\'localhost\' >> /etc/postgresql/9.3/main/postgresql.conf
RUN echo host all all localhost trust >>  /etc/postgresql/9.3/main/pg_hba.conf

EXPOSE 5432

ADD test_task.tar.gz /home
RUN chown -R postgres:postgres /home/test_task/

USER postgres
RUN sh /home/test_task/dataImport.sh


CMD /etc/init.d/nginx start && /etc/init.d/php5-fpm start; sh /home/test_task/countryInfo.sh 




