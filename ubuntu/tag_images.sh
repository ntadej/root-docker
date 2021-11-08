#!/bin/bash

docker tag ntadej/root-ubuntu:6.22.00-py3 ntadej/root-ubuntu:6.22.00
docker tag ntadej/root-ubuntu:6.22.06-py3 ntadej/root-ubuntu:6.22.06
docker tag ntadej/root-ubuntu:6.24.00-py3 ntadej/root-ubuntu:6.24.00

docker tag ntadej/root-ubuntu:6.22.06-py2 ntadej/root-ubuntu:6.22-py2
docker tag ntadej/root-ubuntu:6.22.06-py3 ntadej/root-ubuntu:6.22-py3
docker tag ntadej/root-ubuntu:6.22.06 ntadej/root-ubuntu:6.22

docker tag ntadej/root-ubuntu:6.24.00-py2 ntadej/root-ubuntu:6.24-py2
docker tag ntadej/root-ubuntu:6.24.00-py3 ntadej/root-ubuntu:6.24-py3
docker tag ntadej/root-ubuntu:6.24.00 ntadej/root-ubuntu:6.24

docker tag ntadej/root-ubuntu:6.22-py2 ntadej/root-ubuntu:latest-py2
docker tag ntadej/root-ubuntu:6.22-py3 ntadej/root-ubuntu:latest-py3

docker tag ntadej/root-ubuntu:latest-py3 ntadej/root-ubuntu:latest
