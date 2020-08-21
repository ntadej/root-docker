#!/bin/bash

docker build --progress=plain -t ntadej/root-ubuntu:6.22.00-base upstream/ubuntu --build-arg ROOT_BIN=root_v6.22.00.Linux-ubuntu20-x86_64-gcc9.3.tar.gz
docker build --progress=plain -t ntadej/root-ubuntu:6.22.02-base upstream/ubuntu --build-arg ROOT_BIN=root_v6.22.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz
