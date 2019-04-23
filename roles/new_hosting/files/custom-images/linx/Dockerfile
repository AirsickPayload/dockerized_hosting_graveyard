FROM golang:alpine

RUN set -ex \
        && apk add --no-cache --virtual .build-deps git mercurial \
        && go get github.com/andreimarcu/linx-server \
        && apk del .build-deps

RUN adduser -D user
RUN mkdir /data && chown user /data
USER user
VOLUME ["/data"]
EXPOSE 8080
ENTRYPOINT ["/go/bin/linx-server", "-bind=0.0.0.0:8080", "-filespath=/data/files/", "-metapath=/data/meta/"]
CMD ["-sitename=linx", "-allowhotlink", "-fastcgi", "-realip"]