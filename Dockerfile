FROM        adoptopenjdk/openjdk16:alpine-jre

LABEL       author="Dave W."

RUN         adduser -D -h /home/container container && rm -r /home/container/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
