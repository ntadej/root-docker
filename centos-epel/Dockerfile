FROM centos:7
MAINTAINER tadej@cern.ch

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y install centos-release-scl devtoolset-8-gcc devtoolset-8-gcc-c++ cmake root xrootd-client && \
    yum -y clean all
