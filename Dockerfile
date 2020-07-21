FROM node:10.16-alpine

COPY . /app

WORKDIR /app

RUN echo -e http://mirrors.ustc.edu.cn/alpine/v3.8/main/ > /etc/apk/repositories \
    && apk upgrade --update \
    && apk add bash git ca-certificates python make g++ \
    && npm --unsafe-perm  install -g bower \
    && npm --unsafe-perm --production install \
    && apk del git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]


