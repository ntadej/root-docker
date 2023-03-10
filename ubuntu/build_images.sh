#!/bin/bash

docker build --progress=plain --target final -t ntadej/root-ubuntu:6.28.00-py3 . --build-arg ROOT_VERSION=6-28-00
