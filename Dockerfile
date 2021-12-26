FROM adoptopenjdk/openjdk16:alpine-jre
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
