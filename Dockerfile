FROM debian:stretch-slim
LABEL maintainer="boykuh"
LABEL description="MOHAA Server docker image"
COPY MOHAA /home/container
WORKDIR /home/container
ENV USER=container HOME=/home/container
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y libstdc++5 libstdc++5:i386
COPY MOHAA /home/container
RUN chmod +x mohaa_lnxded
