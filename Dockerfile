FROM debian:stretch-slim
LABEL maintainer="brixton"
LABEL description="MOHAA Server docker image"
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y libstdc++5 libstdc++5:i386
RUN chmod 777 *
COPY MOHAA /opt/MOHAA
WORKDIR /opt/MOHAA
RUN chmod +x mohaa_lnxded run.sh
CMD ./run.sh
