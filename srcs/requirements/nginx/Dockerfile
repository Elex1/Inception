FROM debian:buster

RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install -y nginx 

RUN apt-get install -y openssl

ADD ./conf/default etc/nginx/sites-available/default

ENTRYPOINT mkdir -p /etc/nginx/ssl \
            && openssl req -newkey rsa:2048 -x509 -sha256 -nodes -out /etc/nginx/ssl/cert.pem -keyout /etc/nginx/ssl/certkey.key -subj "/C=MA/ST=REHAMNA/L=Benguerir/O=1337 Inc/OU=DevOps/CN=melghoud.42.fr/emailAddress=melghoud@1337.student.ma" \
            && nginx -g 'daemon off;'
