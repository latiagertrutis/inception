FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/ssl && echo -n "password" > /etc/ssl/password

COPY nginx.conf /etc/nginx/nginx.conf
COPY cert.pem /etc/ssl/cert.pem
COPY key.pem /etc/ssl/key.pem

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
