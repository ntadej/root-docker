#!/bin/bash

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.20-py3-patched . --build-arg PYTHON_VERSION=3 --build-arg ROOT_VERSION=6-20-00-patches
