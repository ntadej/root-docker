#!/bin/bash

docker build --progress=plain -t ntadej/root-ubuntu:latest-py2 . --build-arg PYTHON_VERSION=2
docker build --progress=plain -t ntadej/root-ubuntu:latest-py3 . --build-arg PYTHON_VERSION=3
