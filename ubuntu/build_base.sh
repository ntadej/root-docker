#!/bin/bash

docker build --target base -t ntadej/root-ubuntu-base:latest .

docker build --target base-py2 -t ntadej/root-ubuntu-base:latest-py2 .
docker build --target base-py3 -t ntadej/root-ubuntu-base:latest-py3 .
