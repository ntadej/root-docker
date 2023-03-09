# syntax=docker/dockerfile:experimental

# Defining environment
ARG PYTHON_VERSION=3

# Base image
FROM ubuntu:jammy AS base
LABEL maintainer="tadej@cern.ch"

RUN apt-get update && apt-get dist-upgrade -y \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    krb5-user \
    libkrb5-dev \
    libpam-krb5 \
    libpam-ccreds \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    build-essential \
    ccache \
    gcc g++ \
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

# setup locales
RUN sed -i -e 's/# en_US.UTF-10 UTF-8/en_US.UTF-10 UTF-8/' /etc/locale.gen \
 && locale-gen

# setup cmake
RUN version=3.24.0 \
 && wget https://github.com/Kitware/CMake/releases/download/v$version/cmake-$version-linux-x86_64.sh \
 && mkdir /opt/cmake \
 && sh cmake-$version-linux-x86_64.sh --prefix=/opt/cmake --exclude-subdir --skip-license \
 && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake \
 && rm cmake-$version-linux-x86_64.sh

# Base + Python 2
FROM base as base-py2

RUN apt-get update && apt-get install -y \
    python2 \
    python2-dev \
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install /usr/bin/python python /usr/bin/python2.7 270

# Base + Python 3
FROM base as base-py3

RUN apt-get update && apt-get install -y \
    python3 \
    python3-dev \
    cython3 \
 && rm -rf /var/lib/apt/lists/* \
 && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 310 \
 && update-alternatives --install /usr/bin/cython cython /usr/bin/cython3 310


# Builder
FROM base-py${PYTHON_VERSION} as builder

ARG ROOT_VERSION=6-26-08
ARG XROOTD_VERSION=5.4.3
ENV CCACHE_DIR=/ccache

RUN mkdir -p /root-build/build && cd /root-build \
 && wget https://github.com/root-project/root/archive/v${ROOT_VERSION}.tar.gz \
 && tar xf v${ROOT_VERSION}.tar.gz \
 && mv root-${ROOT_VERSION} src

RUN mkdir -p /root-build/xrootd/build && cd /root-build/xrootd \
 && wget https://xrootd.slac.stanford.edu/download/v${XROOTD_VERSION}/xrootd-${XROOTD_VERSION}.tar.gz \
 && tar xf xrootd-${XROOTD_VERSION}.tar.gz \
 && mv xrootd-${XROOTD_VERSION} src

RUN --mount=type=cache,target=/ccache/ cd /root-build/xrootd/build \
 && CC=/usr/lib/ccache/gcc-11 CXX=/usr/lib/ccache/g++-11 cmake ../src -G Ninja \
 && ninja \
 && ninja install \
 && DESTDIR=/root-build/install ninja install \
 && ccache -s

RUN --mount=type=cache,target=/ccache/ cd /root-build/build \
 && cmake ../src -G Ninja \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DCMAKE_CXX_STANDARD=17 \
    -Dccache=ON \
    -Droofit=ON \
    -Droostats=ON \
    -Dhistfactory=ON \
    -Dminuit2=ON \
 && ninja \
 && DESTDIR=/root-build/install ninja install \
 && ccache -s

RUN cp -r /root-build/install/usr/local/man/* /root-build/install/usr/local/share/man \
 && rm -r /root-build/install/usr/local/man


# Final image
FROM base-py${PYTHON_VERSION} as final

COPY --from=builder /root-build/install .

RUN ldconfig

ENV PYTHONPATH=/usr/local/lib:/usr/local/lib/python3.10/site-packages


# LHAPDF image
FROM final as lhapdf

RUN --mount=type=cache,target=/ccache/ mkdir /lhapdf-build && cd /lhapdf-build \
 && wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.5.1.tar.gz -O LHAPDF-6.5.1.tar.gz \
 && tar xf LHAPDF-6.5.1.tar.gz && cd LHAPDF-6.5.1 \
 && CC=/usr/lib/ccache/gcc-11 CXX=/usr/lib/ccache/g++-11 ./configure --prefix=/usr/local \
 && if ! command -v python2 >/dev/null 2>&1; then rm wrappers/python/lhapdf.cpp; fi \
 && make -j$(nproc) \
 && make -j$(nproc) install \
 && cd / && rm -rf /lhapdf-build \
 && ccache -s \
 && ldconfig

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
    libwebp7 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/linux-test-project/lcov.git \
 && cd lcov \
 && make -j$(nproc) install \
 && cd .. \
 && rm -r lcov
