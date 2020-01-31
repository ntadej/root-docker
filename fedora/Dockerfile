FROM fedora:31
LABEL maintainer="tadej@cern.ch"

RUN dnf -y update && \
    dnf -y install cmake make root xrootd-client && \
    dnf -y clean all
