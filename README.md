# MOHAA-Docker

https://hub.docker.com/repository/docker/brixton/mohaaserver

To update the Docker image and push it somewhere:

- Checkout repository
- Use 7z to expand main folder
- Update the image
- docker build + tag
- docker push

Environment variables:

- MOHCFG_HOSTNAME (sv_hostname)
- MOHCFG_HOSTNAME (rcon password)
- MOHCFG_PASSWORD (join password)
- MOHCFG_REALISM (whether realism or not, to copy the appropriate pak files)
