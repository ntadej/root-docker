FROM centos:7
MAINTAINER tadej@cern.ch

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y install root xrootd-client && \
    yum -y clean all
