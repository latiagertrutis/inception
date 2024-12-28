FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    mariadb-server \
    curl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]
