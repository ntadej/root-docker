FROM fedora:29
MAINTAINER tadej@cern.ch

# Install ROOT
RUN dnf -y update && \
    dnf -y install cmake root xrootd-client && \
    dnf -y clean all

# Install clang-tools-extra
RUN dnf -y update && \
    dnf -y install clang-tools-extra && \
    dnf -y clean all
