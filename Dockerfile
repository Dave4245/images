FROM adoptopenjdk/openjdk16:alpine-jre

RUN adduser -D -h /home/container/data container

ENV USER=container HOME=/home/container

USER container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
