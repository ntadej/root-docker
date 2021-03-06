#!/bin/bash

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.18-py2 . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-18-04
docker build --progress=plain --target final -t ntadej/root-ubuntu:6.18-py3 . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-18-04

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.20-py2 . --build-arg PYTHON_VERSION=2 --build-arg ROOT_VERSION=6-20-04
docker build --progress=plain --target final -t ntadej/root-ubuntu:6.20-py3 . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-20-04
