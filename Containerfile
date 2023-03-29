# This is a comment line 1
FROM ubi8/ubi:8.5
LABEL description="This is a custom Apache using SSL"
MAINTAINER Bruno Steven 
RUN yum install -y net-tools procps httpd  mod_ssl 
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
COPY https-lab/ssl.conf /etc/httpd/conf.d/
ENV APACHE_CERT_DIR=/certificado
EXPOSE 8080 \ 
       8443

#CMD ["httpd", "-D", "FOREGROUND"]
#CMD ["php-fpm", "-D"] 
