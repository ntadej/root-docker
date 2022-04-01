#!/bin/bash

docker tag ntadej/root-ubuntu:6.24.00-py3-dev ntadej/root-ubuntu:6.24.00-dev
docker tag ntadej/root-ubuntu:6.24.06-py3-dev ntadej/root-ubuntu:6.24.06-dev

docker tag ntadej/root-ubuntu:6.24.06-py2-dev ntadej/root-ubuntu:6.24-py2-dev
docker tag ntadej/root-ubuntu:6.24.06-py3-dev ntadej/root-ubuntu:6.24-py3-dev
docker tag ntadej/root-ubuntu:6.24.06-dev ntadej/root-ubuntu:6.24-dev

docker tag ntadej/root-ubuntu:6.24-py2-dev ntadej/root-ubuntu:latest-py2-dev
docker tag ntadej/root-ubuntu:6.24-py3-dev ntadej/root-ubuntu:latest-py3-dev

docker tag ntadej/root-ubuntu:latest-py3-dev ntadej/root-ubuntu:latest-dev
