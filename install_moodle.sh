#http://onnocenter.or.id/wiki/index.php/Moodle:_Ubuntu_20.04_-_Instalasi_Moodle,_Apache2,_Percona5.7,_PHP7.4 
##########################install mysql###########################
sudo apt update
sudo apt install -y mysql-server
sudo mysql_secure_installation

sudo nano /etc/mysql/my.cnf
------------------------------my.cnf--------------------------
[client]
default-character-set = utf8mb4

[mysqld]
innodb_file_per_table = 1
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
skip-character-set-client-handshake

[mysql]
default-character-set = utf8mb4
---------------------------------------------------------------

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
---------------------------mysqld.cnf--------------------------
[mysqld]
max_allowed_packet = 32M
---------------------------------------------------------------
systemctl restart mysql

mysql 
-------------------------------config mysql------------------------
mysql> CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
mysql> CREATE USER moodleuser@localhost IDENTIFIED BY 'passwordmoodle';
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO moodleuser@localhost;
mysql> FLUSH PRIVILEGES;
mysql> exit;
-------------------------------------------------------------
--------------------------Password Optional------------------
SHOW VARIABLES LIKE 'validate_password%';
#Thay doi do kho xac thuc cua mat khau 
SET GLOBAL validate_password.policy = 0;
#Thay doi do dai cua mat khau
SET GLOBAL validate_password.length = 6;
-------------------------------------------------------------

sudo systemctl restart mysql
#############################################################

##########################install apache2####################
sudo apt update
sudo apt install -y apache2
sudo systemctl reload apache2 
#sudo systemctl restart apache2 
#############################################################

##########################install PHP########################
sudo apt update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.4
sudo apt -y install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc \
php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev \
php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap \
php7.4-zip php7.4-cli php7.4-intl \
imagemagick git zip libgd-dev libapache2-mod-php  
sudo systemctl reload apache2

sudo nano /etc/php/7.4/apache2/php.ini
---------------------------php.ini----------------------
upload_max_filesize = 256M
post_max_size = 128M
memory_limit = 512M
max_execution_time = 600
max_input_vars = 3000
max_input_time = 1000
--------------------------------------------------------

sudo systemctl restart apache2
#############################################################

##########################install moodle#####################

mkdir -p /var/moodledata
chmod -Rf 755 /var/moodledata/
chown -Rf www-data: /var/moodledata/

cd /usr/local/src
#Acces via website: https://download.moodle.org/
#Download moodle-version.tgz into /usr/local/src
cp moodle-version.tgz /var/www/html/
cd /var/www/html/
tar -xvf moodle-version.tgz
chmod -Rf 755 /var/www/html/moodle	
chown -Rf www-data: /var/www/html/moodle

#keep moodle up to date
crontab -u www-data -e
chon editor: 1. /bin/nano
*/2 * * * *        /usr/bin/php /var/www/html/moodle/admin/cli/cron.php
*/2 * * * *        /usr/bin/php /var/www/html/moodle/admin/cli/purge_caches.php

###############################################################

