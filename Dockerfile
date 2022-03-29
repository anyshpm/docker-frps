FROM alpine:3.15

MAINTAINER Anyshpm Chen<anyshpm@anyshpm.com>

ARG PLATFORM

ARG FRP_VERSION

ENV FRP_VERSION={FRP_VERSION:-0.41.0}

ENV PLATFORM=amd64

WORKDIR /

RUN set -x && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    tar zxvf frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    cp frp_${FRP_VERSION}_linux_${PLATFORM}/frps /usr/bin/ &&  \
    mkdir -p /etc/frp &&  \
    cp frp_${FRP_VERSION}_linux_${PLATFORM}/frps.ini /etc/frp &&  \
    rm frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    rm -rf frp_${FRP_VERSION}_linux_${PLATFORM}

CMD /usr/bin/frps -c /etc/frp/frps.ini
