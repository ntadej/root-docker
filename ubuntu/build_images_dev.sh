#!/bin/bash

docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.28.00-py3-dev . --build-arg ROOT_VERSION=6-28-00
docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.28.04-py3-dev . --build-arg ROOT_VERSION=6-28-04
docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.28.08-py3-dev . --build-arg ROOT_VERSION=6-28-08
