# Inception

Sys-admin exercise using docker.

## Steps for running from a clean vm
1. Install make, git, openssh-server and filezilla: `sudo apt install make git openssh-server filezilla`.
2. Start the ssh daemon: `sudo systemctl enable ssh --now`.
3. Clone the repository: `git clone <repo-url>`.
4. Copy the `.env`, and `*.pem` files from the host.
5. Make inception install needed dependencies (only working on ubuntu based distributions): `make vm-dependencies`.
6. Log out and log in for the groups change to take effect.
7. `make up`.

## Example of `.env` file
This are the environment variables that the project need in order to work. The `.env` file is intended to be placed in the same directory as the `docker-compose.yml`, this is, `srcs` directory.

```
DOMAIN=mrodrigu.42.fr
FTP_USER=ftp_user
FTP_PASSWORD=ftp_password
MAIL_USER=mail_user
MAIL_PASSWORD=mail_password
MYSQL_MAIL_USER=mysql_mail_user
MYSQL_MAIL_PASSWORD=mysql_mail_password
MYSQL_USER=mysql_user
MYSQL_PASSWORD=mysql_password
MYSQL_ROOT_USER=mrodrigu_user
MYSQL_ROOT_PASSWORD=mrodrigu_password
NETWORK_NAME=inception
SSL_CERT=cert.pem
SSL_CERT_KEY=key.pem
SSL_PASSWORD=password
STATIC_SITE_VOLUME=/home/mrodrigu/data/static
WORDPRESS_VOLUME=/home/mrodrigu/data/wordpress
MARIADB_VOLUME=/home/mrodrigu/data/mariadb
```

> NOTE: Make sure that `SSL_CERT` and `SSL_CERT_KEY` are relative to `srcs/requirements/nginx`
