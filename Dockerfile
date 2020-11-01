FROM debian:stretch-slim
RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig
RUN adduser -D -h /home/container container
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./MOHAA /MOHAA
RUN chmod +x mohaa_lnxded run.sh
CMD ./run.sh
