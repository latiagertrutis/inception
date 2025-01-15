CREATE DATABASE wordpress;
USE wordpress;
-- Format is user@hostname.network_name. Network name appears here since we are using docker.
CREATE USER 'wpuser'@'inception-wordpress.inception' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'inception-wordpress.inception' WITH GRANT OPTION;
