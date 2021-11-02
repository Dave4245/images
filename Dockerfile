FROM        adoptopenjdk/openjdk16:alpine-jre

LABEL       author="Harry W." maintainer="Dave B."

RUN         apk --update add rsync && apt --update add openssh-server sudo -y
RUN         adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
