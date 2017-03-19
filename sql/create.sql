CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'root';

CREATE DATABASE wikidatabase;

GRANT ALL PRIVILEGES on wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;

EXIT
