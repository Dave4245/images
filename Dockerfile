FROM adoptopenjdk/openjdk16:alpine-jre

LABEL author="Dave B."

RUN adduser -D -h /home/container/data container
USER container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
