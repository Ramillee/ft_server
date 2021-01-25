FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx  php-fpm  mariadb-server mariadb-client 
RUN apt-get install -y php-common php-mbstring php-xmlrpc php-soap 
RUN apt-get install -y php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN echo test
ENTRYPOINT [ "atweek" ]