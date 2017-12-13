FROM alpine
MAINTAINER Peter Novotnak <peter@cyrusbio.com>

RUN apk update \
  && apk add rsync

RUN adduser -Ss /bin/false rsyncd \
  && addgroup -S rsyncd

USER rsyncd:rsyncd
EXPOSE 2873
CMD ["rsync", "--daemon", "--no-detach", "--address=0.0.0.0", "--port=2873", "--log-file=/dev/stdout"]

