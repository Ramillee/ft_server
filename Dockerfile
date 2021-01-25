# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atweek <atweek@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/26 00:40:10 by atweek            #+#    #+#              #
#    Updated: 2021/01/26 00:57:10 by atweek           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx  php-fpm  mariadb-server mariadb-client 
RUN apt-get install -y php-common php-mbstring php-xmlrpc php-soap 
RUN apt-get install -y php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN apt-get install -y vim wget unzip
RUN wget http://wordpress.org/latest.zip
RUN unzip -q latest.zip -d /var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
RUN mkdir -p /var/www/html/wordpress/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
RUN ["/bin/bash"]