FROM alpine:3.15

MAINTAINER Anyshpm Chen<anyshpm@anyshpm.com>

ARG PLATFORM

ARG FRP_VERSION

ENV FRP_VERSION=0.38.0

ENV PLATFORM=amd64

WORKDIR /

RUN set -x && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    tar zxvf frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    cp frp_${FRP_VERSION}_linux_${PLATFORM}/frpc /usr/bin/ &&  \
    mkdir -p /etc/frp &&  \
    cp frp_${FRP_VERSION}_linux_${PLATFORM}/frpc.ini /etc/frp &&  \
    rm frp_${FRP_VERSION}_linux_${PLATFORM}.tar.gz &&  \
    rm -rf frp_${FRP_VERSION}_linux_${PLATFORM}

CMD /usr/bin/frpc -c /etc/frp/frpc.ini
