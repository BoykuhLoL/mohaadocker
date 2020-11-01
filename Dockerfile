FROM debian:stretch-slim
RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./MOHAA /home/container
RUN chmod -R 777 /home/container
