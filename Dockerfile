FROM debian:buster

# updates & installs
RUN apt-get update
RUN apt-get -y upgrade \
	wget zsh git vim\
	nginx \ 
	mariadb-server mariadb-client \
	php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

EXPOSE 80 443

# working directory
WORKDIR /usr/share/nginx/html

# NGINX (conf) 
RUN rm /etc/nginx/sites-enabled/default
ADD /srcs/default.conf /etc/nginx/conf.d
ADD /srcs/option /etc/nginx/conf.d

# PHPMyAdmin (dl + conf)
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
ADD /srcs/config.inc.php phpmyadmin

# WordPress (dl + conf)
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# SSL
RUN openssl req -x509 -nodes -days 1826 -subj \
	"/C=FR/ST=FRANCE/L=LYON/OU=42LYON/CN=gvenet" \
	-newkey rsa:2048 -keyout /etc/ssl/certs/server.key \
	-out /etc/ssl/certs/server.crt;

# tools & scripts
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ADD /srcs/pacman pacman
ADD /srcs/html/* ./

RUN chown root:www-data *
RUN chmod 755 -R *
CMD bash init.sh

