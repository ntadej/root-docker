#!/bin/bash

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.26.08-py2 . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-26-08
docker build --progress=plain --target final -t ntadej/root-ubuntu:6.26.08-py3 . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-26-08
