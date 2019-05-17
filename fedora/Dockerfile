FROM fedora:30
MAINTAINER tadej@cern.ch

RUN dnf -y update && \
    dnf -y install cmake make root xrootd-client && \
    dnf -y clean all
