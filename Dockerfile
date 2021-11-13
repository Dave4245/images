FROM adoptopenjdk/openjdk16:alpine-jre

LABEL author="Dave B."

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
ARG EASY_ADD_VER=0.7.1

ADD https://github.com/itzg/easy-add/releases/download/${EASY_ADD_VER}/easy-add_${TARGETOS}_${TARGETARCH}${TARGETVARIANT} /usr/bin/easy-add

RUN adduser -D -h /home/container container && chmod +x /usr/bin/easy-add && \
    easy-add --var os=${TARGETOS} --var arch=${TARGETARCH}${TARGETVARIANT} --var version=1.8.0 --var app=mc-server-runner --file {{.app}} --from https://github.com/itzg/{{.app}}/releases/download/{{.version}}/{{.app}}_{{.version}}_{{.os}}_{{.arch}}.tar.gz

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGTERM

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
