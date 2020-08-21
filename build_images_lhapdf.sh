#!/bin/bash

docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.22.00-lhapdf . --build-arg ROOT_VERSION=6.22.00
docker build --progress=plain --target lhapdf -t ntadej/root-ubuntu:6.22.02-lhapdf . --build-arg ROOT_VERSION=6.22.02
