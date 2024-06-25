FROM httpd:2.4

RUN apt-get update && \
    apt-get install -y apache2-utils libapache2-mod-fcgid && \
    apt-get clean

RUN sed -i '/^#LoadModule rewrite_module/s/^#//' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/^#LoadModule vhost_alias_module/s/^#//' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/^#LoadModule proxy_module/s/^#//' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/^#LoadModule proxy_fcgi_module/s/^#//' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/^#LoadModule setenvif_module/s/^#//' /usr/local/apache2/conf/httpd.conf

COPY vhost.conf /usr/local/apache2/conf/vhost.conf

RUN echo "Include /usr/local/apache2/conf/vhost.conf" >> /usr/local/apache2/conf/httpd.conf
