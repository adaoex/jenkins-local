FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get -y install lsb-release
RUN apt -y install lsb-release apt-transport-https ca-certificates

RUN apt-get update && apt-get -y install php7.4 php7.4-mbstring php7.4-xml php7.4-bcmath php7.4-mysql php7.4-redis php7.4-zip php7.4-gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
