FROM fedora:31
LABEL maintainer="tadej@cern.ch"

# Install ROOT
RUN dnf -y update && \
    dnf -y install cmake make root xrootd-client && \
    dnf -y clean all

# Install clang-tools-extra
RUN dnf -y update && \
    dnf -y install clang-tools-extra && \
    dnf -y clean all
