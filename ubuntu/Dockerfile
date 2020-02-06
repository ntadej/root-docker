# syntax=docker/dockerfile:experimental

# Defining environment
ARG PYTHON_VERSION=2

# Base image
FROM ubuntu:bionic AS base
LABEL maintainer="tadej@cern.ch"

RUN apt-get update && apt-get install -y \
    build-essential \
    ccache \
    cmake \
    gcc-8 g++-8 \
    git \
    locales \
    lsb-release \
    ninja-build \
    wget \
    fonts-freefont-ttf \
    libfftw3-dev \
    libgsl-dev \
    libkrb5-dev \
    libldap2-dev \
    liblz4-dev \
    liblzma-dev \
    libreadline-dev \
    libssl-dev \
    libtbb-dev \
    libx11-dev \
    libxext-dev \
    libxft-dev \
    libxml2-dev \
    libxpm-dev \
    libz-dev \
    uuid-dev \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

# set gcc 8 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

# setup locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen


# Base + Python 2
FROM base as base-py2

RUN apt-get update && apt-get install -y \
    python \
    python-dev \
 && rm -rf /var/lib/apt/lists/*


# Base + Python 3
FROM base as base-py3

RUN apt-get update && apt-get install -y \
    python3 \
    python3-dev \
 && rm -rf /var/lib/apt/lists/*


# Builder
FROM base-py${PYTHON_VERSION} as builder

ARG ROOT_VERSION=6.18.04
ENV CCACHE_DIR=/ccache

RUN mkdir -p /root-build/build && cd /root-build \
 && wget https://root.cern/download/root_v${ROOT_VERSION}.source.tar.gz \
 && tar xf root_v${ROOT_VERSION}.source.tar.gz \
 && mv root-${ROOT_VERSION} src

RUN mkdir -p /root-build/xrootd/build && cd /root-build/xrootd \
 && wget https://xrootd.slac.stanford.edu/download/v4.11.1/xrootd-4.11.1.tar.gz \
 && tar xf xrootd-4.11.1.tar.gz \
 && mv xrootd-4.11.1 src

RUN --mount=type=cache,target=/ccache/ cd /root-build/xrootd/build \
 && CC=/usr/lib/ccache/gcc-8 CXX=/usr/lib/ccache/g++-8 cmake ../src -G Ninja \
 && ninja \
 && ninja install \
 && DESTDIR=/root-build/install ninja install \
 && ccache -s

RUN --mount=type=cache,target=/ccache/ cd /root-build/build \
 && cmake ../src -G Ninja -DCMAKE_CXX_STANDARD=17 -Dccache=ON \
 && ninja \
 && DESTDIR=/root-build/install ninja install \
 && ccache -s

RUN cp -r /root-build/install/usr/local/man/* /root-build/install/usr/local/share/man \
 && rm -r /root-build/install/usr/local/man


# Final image
FROM base-py${PYTHON_VERSION} as final

COPY --from=builder /root-build/install .

RUN ldconfig

ENV PYTHONPATH=/usr/local/lib
