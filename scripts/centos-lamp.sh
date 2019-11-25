#!/bin/bash

yum update -y --exclude=kernal
yum install -y git unzip screen
yum install -y httpd httpd-devel httpd-tools

chkconfig --add httpd
chkconfig httpd on

service httpd stop

rm -rf /var/www/html

ln -s /vagrant /var/www/html

service httpd start

yum install -y php php-cli php-common php-devel php-mysql

yum install -y mysql mysql-server mysql-devel

chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysqld -u root -e "SHOW DATABASES";


