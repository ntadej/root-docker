#!/bin/bash

docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.26.10-py2-dev . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-26-10
docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.26.10-py3-dev . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-26-10

docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.26.08-py2-dev . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-26-08
docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.26.08-py3-dev . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-26-08
