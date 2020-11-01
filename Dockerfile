# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM  quay.io/parkervcp/pterodactyl-images:base_ubuntu

LABEL author="Boy Kemps" maintainer="boy@aethraesports.com"

## install reqs
RUN   dpkg --add-architecture i386 \
 &&   apt update \
 &&   apt upgrade -y \
 &&   apt install -y libtbb2:i386 libtinfo5:i386 libcurl4-gnutls-dev:i386 libcurl4:i386 libncurses5:i386 libcurl3-gnutls:i386 libtcmalloc-minimal4:i386 faketime:i386 libtbb2:i386 \
      lib32stdc++6 lib32z1 libtbb2 libtinfo5 libreadline5 libncursesw5 libfontconfig1 libnss-wrapper libprotobuf-dev libidn11-dev gettext-base libstdc++5 libstdc++5:i386

## install rcon
RUN   cd /tmp/ \
 &&   curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v0.6.0/rcon-0.6.0-amd64_linux.tar.gz > rcon.tar.gz \
 &&   tar xvf rcon.tar.gz \
 &&   mv rcon-0.6.0-amd64_linux/rcon /usr/local/bin/

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY  ./entrypoint.sh /entrypoint.sh
