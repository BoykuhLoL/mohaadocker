FROM debian:stretch-slim
RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./MOHAA /MOHAA
RUN chmod +x /MOHAA/mohaa_lnxded run.sh
RUN chmod +x /MOHAA/run.sh
CMD /MOHAA/run.sh
