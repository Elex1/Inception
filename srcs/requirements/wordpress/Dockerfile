FROM debian:buster

RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install -y php-fpm php-mysql wget unzip

ADD ./conf/wp-config.php /wp-config.php

ENTRYPOINT [ ! -d "/var/www/wordpress/" ] && wget -P /var/www/ https://wordpress.org/latest.zip \
			&& unzip /var/www/latest.zip -d /var/www/ \
			&& rm -rf /var/www/latest.zip \
			&& chown -R www:data /var/www/wordpress/ \
			; echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
			; mkdir -p /run/php/ \
			; /usr/sbin/php-fpm7.3 -F -R

