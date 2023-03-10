#!/bin/bash

docker tag ntadej/root-ubuntu:6.26.10-py3 ntadej/root-ubuntu:6.26.10
docker tag ntadej/root-ubuntu:6.26.08-py3 ntadej/root-ubuntu:6.26.08

docker tag ntadej/root-ubuntu:6.26.10-py2 ntadej/root-ubuntu:6.26-py2
docker tag ntadej/root-ubuntu:6.26.10-py3 ntadej/root-ubuntu:6.26-py3
docker tag ntadej/root-ubuntu:6.26.10 ntadej/root-ubuntu:6.26

docker tag ntadej/root-ubuntu:6.26-py2 ntadej/root-ubuntu:latest-py2
docker tag ntadej/root-ubuntu:6.26-py3 ntadej/root-ubuntu:latest-py3

docker tag ntadej/root-ubuntu:latest-py3 ntadej/root-ubuntu:latest
