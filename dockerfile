FROM alpine:latest

RUN apk update
RUN apk add --no-cache bash date git 

COPY entrypoint.sh /usr/bin/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
