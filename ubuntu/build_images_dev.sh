#!/bin/bash

docker build --progress=plain --target dev -t ntadej/root-ubuntu:6.28.00-py3-dev . --build-arg ROOT_VERSION=6-28-00
