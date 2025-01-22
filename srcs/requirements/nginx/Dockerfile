FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

COPY nginx.conf /etc/nginx/
COPY cert.pem /etc/ssl/
COPY key.pem /etc/ssl/

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
