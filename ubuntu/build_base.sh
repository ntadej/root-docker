#!/bin/bash

docker build --no-cache --pull --progress=plain --target base -t ntadej/root-ubuntu-base:latest .

docker build --progress=plain --target base-py3 -t ntadej/root-ubuntu-base:latest-py3 .
