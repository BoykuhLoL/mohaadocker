FROM debian:stretch-slim
RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
RUN chmod 777 /home/container
