FROM openjdk:8-jdk-alpine
RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser -D -h /home/container container
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./MOHAA /MOHAA
CMD ["/bin/bash", "/run.sh"]
