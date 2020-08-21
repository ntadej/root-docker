#!/bin/bash

docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.22.00-dev . --build-arg ROOT_VERSION=6.22.00
docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.22.02-dev . --build-arg ROOT_VERSION=6.22.02
