FROM php:7.4-fpm

RUN apt-get update \
        && apt install -y default-mysql-client libonig-dev\
        && apt install -y procps lsof vim curl iputils-ping net-tools \
        && docker-php-ext-install pdo_mysql 

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"\
        && php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"\
        && php composer-setup.php\
        && php -r "unlink('composer-setup.php');"\
        && mv composer.phar /usr/local/bin/composer;

RUN useradd -m -s /bin/bash -u 1000 developer
RUN mkdir -p /var/run/php-fpm && chown developer:developer /var/run/php-fpm

RUN touch /var/log/fpm-php.www.log
RUN chown developer:developer /var/log/fpm-php.www.log