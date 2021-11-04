FROM        adoptopenjdk/openjdk16:alpine-jre

LABEL       author="Harry W." maintainer="Dave B."

RUN         apk --update add openssh-server && apk --update add rsync && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         rsync -avvvz root@185.249.218.124:/root/templates/manhunt/ /home/container/

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
