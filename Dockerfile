FROM        adoptopenjdk/openjdk16:alpine-jre

LABEL       author="Harry W." maintainer="Dave B."

RUN         apk --update add openssh-server && apk --update add rsync && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

EXPOSE      22 22

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
