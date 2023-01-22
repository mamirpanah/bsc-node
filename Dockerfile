FROM debian:bullseye-slim

RUN apt-get update -y \
  && apt-get install -y curl jq unzip procps telnet wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV VERSION=1.0.7

RUN wget $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep geth_linux |cut -d\" -f4) && \
    mv geth_linux /usr/local/bin/geth && \
    chmod +x /usr/local/bin/geth && \
    wget $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4) && \
    unzip mainnet.zip -d /