FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
    wget parted dosfstools binutils p7zip-full udev \
    sudo xz-utils jq u-boot-tools

USER root

# The repository should be mounted at /app.
WORKDIR /app

COPY * /app

# RUN chmod +x *.sh && chmod +x init.*

VOLUME [ "/config", "/images", "/deps" ]

ENTRYPOINT [ "/app/build-image.sh" ]
CMD ALL