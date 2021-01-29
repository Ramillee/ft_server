# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atweek <atweek@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/26 00:40:10 by atweek            #+#    #+#              #
#    Updated: 2021/01/29 15:57:36 by atweek           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx mariadb-server 
RUN apt-get install -y php-curl php-gd php-json php-mbstring php-xml php-fpm
RUN apt-get install -y vim nginx openssl php-mysql wget

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/html/wordpress

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
RUN tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz && rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.7-all-languages/ /var/www/html/phpmyadmin/

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=None/CN=www.example.com"

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
RUN mkdir -p /var/www/html/wordpress/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/phpmyadmin/

COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY srcs/nginx.conf /etc/nginx/sites-available/default
COPY srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php

COPY srcs/*.sh ./
COPY srcs/init.sql ./
RUN chmod 777 *.sh
RUN chmod 777 *.sql

RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
EXPOSE 80 443
CMD bash start.sh