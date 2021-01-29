service mysql start
service nginx start
nginx -t
nginx -s reload
mysql  < init.sql
service php7.3-fpm start
bash