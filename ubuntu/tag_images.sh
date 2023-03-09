#!/bin/bash

docker tag ntadej/root-ubuntu:6.26.08-py3 ntadej/root-ubuntu:6.26.08

docker tag ntadej/root-ubuntu:6.26.08-py2 ntadej/root-ubuntu:6.26-py2
docker tag ntadej/root-ubuntu:6.26.08-py3 ntadej/root-ubuntu:6.26-py3
docker tag ntadej/root-ubuntu:6.26.08 ntadej/root-ubuntu:6.26

docker tag ntadej/root-ubuntu:6.26-py2 ntadej/root-ubuntu:latest-py2
docker tag ntadej/root-ubuntu:6.26-py3 ntadej/root-ubuntu:latest-py3

docker tag ntadej/root-ubuntu:latest-py3 ntadej/root-ubuntu:latest
