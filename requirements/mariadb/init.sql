CREATE DATABASE wordpress;
USE wordpress;
CREATE USER 'wpuser'@'inception-wordpress.inception' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'inception-wordpress.inception' WITH GRANT OPTION;
