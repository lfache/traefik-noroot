FROM docker.io/traefik:2.2

RUN set -ex; \
        addgroup -g 1001 -S traefik; \
        adduser -S -D -H -u 1001 -h /home/traefik -s /sbin/nologin -G traefik -g traefik traefik

USER traefik
