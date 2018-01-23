FROM ubuntu:16.04

# init
RUN apt-get update && apt-get install -y \
    software-properties-common \
    autoconf \
    libtool \
    libprotobuf-c-dev \
    libsodium-dev \
    libbase58-dev \
    libsqlite3-dev \
    libgmp-dev \
    libsqlite3-dev \
    asciidoc \
    git

# c0ban
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update && apt-get install -y \
  libboost-all-dev \
  libdb4.8-dev \
  libdb4.8++-dev \
  libprotobuf-dev \
  protobuf-compiler \
  libzmq3-dev \
  libminiupnpc-dev \
  libqrencode-dev \
  git \
  build-essential \
  libtool \
  autotools-dev \
  automake \
  autoconf \
  pkg-config \
  libssl-dev \
  libevent-dev \
  bsdmainutils

COPY ./bitcoin-15/bitcoin-cli-15 /usr/local/bin/bitcoin-cli
COPY ./bitcoin-15/bitcoind-15 /usr/local/bin/bitcoind
COPY ./c0ban-15/c0ban-cli /usr/local/bin
COPY ./c0ban-15/c0band /usr/local/bin
COPY ./lightning/lightning-cli /usr/local/bin
COPY ./lightning/lightningd /usr/local/bin
COPY ./lightning/libexec /usr/local/libexec

COPY ./c0ban-15/c0ban.conf /root

CMD ["/sbin/init"]
