FROM        adoptopenjdk/openjdk8-openj9:debian-slim

LABEL       author="Boykuh" maintainer="boy@aethra.loc"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 unzip wget \
 && useradd -d /home/container -m container
 
RUN chmod 775 /home/container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
