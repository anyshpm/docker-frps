FROM alpine:3.18

MAINTAINER Anyshpm Chen<anyshpm@anyshpm.com>

ARG TARGETARCH

ARG FRP_VERSION

ENV FRP_VERSION=${FRP_VERSION:-0.63.0}

ENV TARGETARCH=${TARGETARCH:-amd64}

WORKDIR /

#COPY frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz /

RUN set -x && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    tar zxvf frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    cp frp_${FRP_VERSION}_linux_${TARGETARCH}/frps /usr/bin/ &&  \
    mkdir -p /etc/frp &&  \
    cp frp_${FRP_VERSION}_linux_${TARGETARCH}/*.toml  /etc/frp &&  \
    rm frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    rm -rf frp_${FRP_VERSION}_linux_${TARGETARCH}
