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

COPY . /lightning
WORKDIR /lightning

RUN cd /lightning/lightning && \
  ./autogen.sh && \
  ./configure && \
  make -j4 && \
  make install

CMD ["/sbin/init"]

# RUN mkdir /c0ban
#
# CMD ["/c0ban/bin/c0band", "-conf=/c0ban/c0ban.conf", "-datadir=/c0ban-block/"]
