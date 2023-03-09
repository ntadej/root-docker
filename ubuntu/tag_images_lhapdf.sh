#!/bin/bash

docker tag ntadej/root-ubuntu:6.26.08-py3-lhapdf ntadej/root-ubuntu:6.26.08-lhapdf

docker tag ntadej/root-ubuntu:6.26.08-py2-lhapdf ntadej/root-ubuntu:6.26-py2-lhapdf
docker tag ntadej/root-ubuntu:6.26.08-py3-lhapdf ntadej/root-ubuntu:6.26-py3-lhapdf
docker tag ntadej/root-ubuntu:6.26.08-lhapdf ntadej/root-ubuntu:6.26-lhapdf

docker tag ntadej/root-ubuntu:6.26-py2-lhapdf ntadej/root-ubuntu:latest-py2-lhapdf
docker tag ntadej/root-ubuntu:6.26-py3-lhapdf ntadej/root-ubuntu:latest-py3-lhapdf

docker tag ntadej/root-ubuntu:latest-py3-lhapdf ntadej/root-ubuntu:latest-lhapdf
