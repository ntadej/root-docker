#!/bin/bash

docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.24.00-py2-lhapdf . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-24-00
docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.24.00-py3-lhapdf . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-24-00

docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.24.06-py2-lhapdf . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-24-06
docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.24.06-py3-lhapdf . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-24-06
