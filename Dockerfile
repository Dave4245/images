FROM  eclipse-temurin:17-alpine

RUN adduser -D -h /home/data container
USER container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
