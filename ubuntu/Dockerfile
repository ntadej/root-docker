# syntax=docker/dockerfile:experimental

# Defining environment
ARG PYTHON_VERSION=2

# Base image
FROM ubuntu:bionic AS base
LABEL maintainer="tadej@cern.ch"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    krb5-user \
    libkrb5-dev \
    libpam-krb5 \
    libpam-ccreds \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    build-essential \
    ccache \
    gcc-8 g++-8 \
    git \
    locales \
    lsb-release \
    ninja-build \
    wget \
    fonts-freefont-ttf \
    libfftw3-dev \
    libgsl-dev \
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

RUN apt-get update && apt-get dist-upgrade -y \
 && rm -rf /var/lib/apt/lists/*

# set gcc 8 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
    --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7 \
    --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7 \
    --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-7 \
    --slave /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-7 \
    --slave /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-7 \
    --slave /usr/bin/x86_64-linux-gnu-cpp x86_64-linux-gnu-cpp /usr/bin/x86_64-linux-gnu-cpp-7 \
    --slave /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ /usr/bin/x86_64-linux-gnu-g++-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/x86_64-linux-gnu-gcc-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-ar x86_64-linux-gnu-gcc-ar /usr/bin/x86_64-linux-gnu-gcc-ar-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-nm x86_64-linux-gnu-gcc-nm /usr/bin/x86_64-linux-gnu-gcc-nm-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-ranlib x86_64-linux-gnu-gcc-ranlib /usr/bin/x86_64-linux-gnu-gcc-ranlib-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcov x86_64-linux-gnu-gcov /usr/bin/x86_64-linux-gnu-gcov-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcov-dump x86_64-linux-gnu-gcov-dump /usr/bin/x86_64-linux-gnu-gcov-dump-7 \
    --slave /usr/bin/x86_64-linux-gnu-gcov-tool x86_64-linux-gnu-gcov-tool /usr/bin/x86_64-linux-gnu-gcov-tool-7 \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-8 \
    --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-8 \
    --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-8 \
    --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-8 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-8 \
    --slave /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-8 \
    --slave /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-8 \
    --slave /usr/bin/x86_64-linux-gnu-cpp x86_64-linux-gnu-cpp /usr/bin/x86_64-linux-gnu-cpp-8 \
    --slave /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ /usr/bin/x86_64-linux-gnu-g++-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/x86_64-linux-gnu-gcc-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-ar x86_64-linux-gnu-gcc-ar /usr/bin/x86_64-linux-gnu-gcc-ar-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-nm x86_64-linux-gnu-gcc-nm /usr/bin/x86_64-linux-gnu-gcc-nm-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcc-ranlib x86_64-linux-gnu-gcc-ranlib /usr/bin/x86_64-linux-gnu-gcc-ranlib-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcov x86_64-linux-gnu-gcov /usr/bin/x86_64-linux-gnu-gcov-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcov-dump x86_64-linux-gnu-gcov-dump /usr/bin/x86_64-linux-gnu-gcov-dump-8 \
    --slave /usr/bin/x86_64-linux-gnu-gcov-tool x86_64-linux-gnu-gcov-tool /usr/bin/x86_64-linux-gnu-gcov-tool-8

# setup locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen

# setup cmake
RUN version=3.16 \
 && build=5 \
 && wget https://cmake.org/files/v$version/cmake-$version.$build-Linux-x86_64.sh \
 && mkdir /opt/cmake \
 && sh cmake-$version.$build-Linux-x86_64.sh --prefix=/opt/cmake --exclude-subdir --skip-license \
 && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake \
 && rm cmake-$version.$build-Linux-x86_64.sh

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
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install /usr/bin/python python /usr/bin/python3.6 36


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


# LHAPDF image
FROM final as lhapdf

RUN --mount=type=cache,target=/ccache/ mkdir /lhapdf-build && cd /lhapdf-build \
 && wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz \
 && tar xf LHAPDF-6.2.3.tar.gz && cd LHAPDF-6.2.3 \
 && CC=/usr/lib/ccache/gcc-8 CXX=/usr/lib/ccache/g++-8 ./configure --prefix=/usr/local \
 && make \
 && make install \
 && cd / && rm -rf /lhapdf-build \
 && ccache -s \
 && ldconfig \
 && lhapdf --listdir /usr/local/share/LHAPDF/ install NNPDF30_lo_as_0130 NNPDF30_nlo_as_0118 NNPDF30_nnlo_as_0118


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
 && make install \
 && cd .. \
 && rm -r lcov
