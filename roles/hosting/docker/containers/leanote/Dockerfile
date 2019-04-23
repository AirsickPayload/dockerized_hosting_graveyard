FROM alpine:latest
MAINTAINER Alan Matuszczak <redacted>

ENV adminUser admin

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache curl sed grep coreutils

RUN curl -L http://sourceforge.net/projects/leanote-bin/files/2.4/leanote-linux-amd64-v2.4.bin.tar.gz/download > leanote.tar.gz && \
    tar xf leanote.tar.gz
RUN sed -i -- "s|adminUsername.*|adminUsername=$adminUser|g" leanote/conf/app.conf && \
    secret=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 64 | tr -d '\n') && \
    sed -i -- "s|app.secret.*|app.secret=$secret|g" leanote/conf/app.conf && \
    sed -i -- "s|db.host.*|db.host=172.28.0.25|g" leanote/conf/app.conf && \
    sed -i -- "s|site.url.*|site.url=https://leanote.redacted|g" leanote/conf/app.conf && \
    chmod 755 leanote/bin/run.sh

EXPOSE 9000

ENTRYPOINT ["leanote/bin/run.sh"]
