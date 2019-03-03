FROM fedora:29
MAINTAINER tadej@cern.ch

RUN dnf -y update && \
    dnf -y install cmake root xrootd-client && \
    dnf -y clean all
