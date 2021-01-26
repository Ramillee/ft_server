# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atweek <atweek@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/26 00:40:10 by atweek            #+#    #+#              #
#    Updated: 2021/01/27 00:20:37 by atweek           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
# RUN apt-get install -y nginx  php-fpm  mariadb-server mariadb-client 
# RUN apt-get install -y php-common php-mbstring php-xmlrpc php-soap 
# RUN apt-get install -y php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN apt-get install -y nginx mariadb-server
RUN apt-get install -y php-curl php-gd php-json php-mbstring php-xml
RUN apt-get install -y vim nginx mariadb-server openssl php-mysql wget
# RUN ls -al

# ADD https://wordpress.org/latest.tar.gz /var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
# RUN ls /var/www/html/

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
RUN mkdir -p /var/www/html/wordpress/wp-content/uploads
#key
# RUN openssl genrsa -out key.pem -aes-256-cfb -rand /var/log/messages 4096
#configs
COPY srcs/wp-config.php /var/www/html/wp-config.php
COPY /srcs/nginx.conf /etc/nginx/sites-available/defaul

COPY srcs/*.sh ./
RUN chmod 777 *.sh

RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
CMD bash start.sh
EXPOSE 80