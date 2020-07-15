#!/bin/bash

docker build --progress=plain --target base -t ntadej/root-ubuntu-base:latest .

docker build --progress=plain --target base-py2 -t ntadej/root-ubuntu-base:latest-py2 .
docker build --progress=plain --target base-py3 -t ntadej/root-ubuntu-base:latest-py3 .
