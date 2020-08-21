# syntax=docker/dockerfile:experimental

ARG ROOT_VERSION=6.22.02

# Base image
FROM ntadej/root-ubuntu:${ROOT_VERSION}-base AS base
LABEL maintainer="tadej@cern.ch"

WORKDIR /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ccache \
    git \
    krb5-user \
    libkrb5-dev \
    libpam-ccreds \
    libpam-krb5 \
    lsb-release \
    ninja-build \
    python3 \
    python3-dev \
    wget \
 && rm -rf /var/lib/apt/lists/*

# setup locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen

# Builder
FROM base as builder

ARG XROOTD_VERSION=4.10.1

ENV CCACHE_DIR=/ccache

RUN mkdir -p /root-build/xrootd/build && cd /root-build/xrootd \
 && wget https://xrootd.slac.stanford.edu/download/v${XROOTD_VERSION}/xrootd-${XROOTD_VERSION}.tar.gz \
 && tar xf xrootd-${XROOTD_VERSION}.tar.gz \
 && mv xrootd-${XROOTD_VERSION} src

RUN --mount=type=cache,target=/ccache/ cd /root-build/xrootd/build \
 && CC=/usr/lib/ccache/gcc-9 CXX=/usr/lib/ccache/g++-9 cmake ../src -G Ninja -DPYTHON_EXECUTABLE=/usr/bin/python3 \
 && ninja \
 && ninja install \
 && DESTDIR=/root-build/install ninja install \
 && ccache -s


# Final image
FROM base as final

COPY --from=builder /root-build/install .

RUN ldconfig

ENV PYTHONPATH=/opt/root/lib:/usr/local/lib/python3.8/site-packages


# LHAPDF image
FROM final as lhapdf

RUN --mount=type=cache,target=/ccache/ mkdir /lhapdf-build && cd /lhapdf-build \
 && wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.3.0.tar.gz -O LHAPDF-6.3.0.tar.gz \
 && tar xf LHAPDF-6.3.0.tar.gz && cd LHAPDF-6.3.0 \
 && CC=/usr/lib/ccache/gcc-9 CXX=/usr/lib/ccache/g++-9 ./configure --prefix=/usr/local \
 && make -j$(nproc) \
 && make -j$(nproc) install \
 && cd / && rm -rf /lhapdf-build \
 && ccache -s \
 && ldconfig \
 && sed -i 's@/usr/bin/env python@/usr/bin/env python3@g' /usr/local/bin/lhapdf

RUN lhapdf --listdir /usr/local/share/LHAPDF/ install \
    NNPDF30_lo_as_0130 \
    NNPDF30_nlo_as_0118 \
    NNPDF30_nnlo_as_0118


# Dev image
FROM lhapdf as dev

RUN apt-get update && apt-get install -y \
    libgd-perl \
    libgd3 \
    libjbig0 \
    libjpeg-turbo8 \
    libjpeg8 \
    libjson-perl \
    libperlio-gzip-perl \
    libtiff5 \
    libwebp6 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/linux-test-project/lcov.git \
 && cd lcov \
 && make -j$(nproc) install \
 && cd .. \
 && rm -r lcov
