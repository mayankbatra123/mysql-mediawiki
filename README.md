Creating Docker containers using Mysql and applciation as Mediawiki

USAGE:

Part1 : MySQL DB
sudo docker run --net mynet123 --ip 172.18.0.2 --name mysql -h mysql -p 3306:3306 -e MYSQL_USER='root' -e MYSQL_PASS='root' -e MYSQL_CLIENT='172.18.0.%' -e TERMTAG='mysql' mayank/mysql:2

PART 2: Media Wiki Instance

sudo docker --net mynet123 --ip 172.18.0.4 --name mediawiki -h mediawiki --link mysql:mysql -e MEDIAWIKI_SITE_SERVER='http://172.18.0.4:80' -e MEDIAWIKI_SITE_NAME='Media Wiki' -e MEDIAWIKI_ADMIN_USER='admin' -e MEDIAWIKI_ADMIN_PASS='admin' -e MEDIAWIKI_DB_HOST='172.18.0.2' -e MEDIAWIKI_DB_PORT='3306' -e MEDIAWIKI_DB_USER='root' -e MEDIAWIKI_DB_PASSWORD='root' -e MEDIAWIKI_DB_NAME='wikidatabase' mayank/mediawiki:3
