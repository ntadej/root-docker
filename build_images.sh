#!/bin/bash

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.22.00 . --build-arg ROOT_VERSION=6.22.00
docker build --progress=plain --target final -t ntadej/root-ubuntu:6.22.02 . --build-arg ROOT_VERSION=6.22.02
