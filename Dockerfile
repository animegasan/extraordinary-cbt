# Startup from alpine
FROM alpine:3.14
LABEL Maintainer = "Hilman Maulana, Kuswandi"
LABEL Description = "Extraordinary CBT is a web-based application for exam management that can be run online or locally, hosting or VPS"

# Setup document root
WORKDIR /var/www/html

# Expose the port
EXPOSE 80
EXPOSE 3306

# Install packages
RUN apk add --no-cache \
    nginx \
    php7 \
    php7-fpm \
    php7-dom \
    php7-xml \
    php7-xmlwriter \
    php7-xmlreader \
    php7-simplexml \
    php7-tokenizer \
    php7-mysqli \
    php7-openssl \
    php7-json \
    php7-curl \
    php7-mbstring \
    php7-zip \
    php7-fileinfo \
    php7-gd \
    php7-pdo \
    php7-pdo_mysql \
    php7-session \
    php7-ctype \
    mysql \
    mysql-client \
    supervisor \
    wget

# Configure nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY conf/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY conf/php.ini /etc/php7/conf.d/custom.ini

# Configure mysql
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/mysql.sh /app/
RUN chmod +x /app/mysql.sh

# Configure supervisord
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
    
# Add application
RUN mkdir /cache/ && \
    wget -O /cache/ecbt.zip https://shellrean.sgp1.cdn.digitaloceanspaces.com/extraordinarycbt%2Frelease%2Fexo-cbt3.16.3.build-5%20-%20ristretto-compiled.zip && \
    unzip /cache/ecbt.zip -d /cache && \
    mv /cache/'exo-cbt3.16.3.build-5 - ristretto-compiled'/the-exo-cbt/* /var/www/html && \
    mv /cache/'exo-cbt3.16.3.build-5 - ristretto-compiled'/dump-mysql.sql /app && \
    rm -r /cache
COPY conf/.env /var/www/html
RUN chown -R nginx:nginx /var/www/html

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
