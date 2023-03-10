#!/bin/bash

docker tag ntadej/root-ubuntu:6.26.10-py3-dev ntadej/root-ubuntu:6.26.10-dev
docker tag ntadej/root-ubuntu:6.26.08-py3-dev ntadej/root-ubuntu:6.26.08-dev

docker tag ntadej/root-ubuntu:6.26.10-py2-dev ntadej/root-ubuntu:6.26-py2-dev
docker tag ntadej/root-ubuntu:6.26.10-py3-dev ntadej/root-ubuntu:6.26-py3-dev
docker tag ntadej/root-ubuntu:6.26.10-dev ntadej/root-ubuntu:6.26-dev

docker tag ntadej/root-ubuntu:6.26-py2-dev ntadej/root-ubuntu:latest-py2-dev
docker tag ntadej/root-ubuntu:6.26-py3-dev ntadej/root-ubuntu:latest-py3-dev

docker tag ntadej/root-ubuntu:latest-py3-dev ntadej/root-ubuntu:latest-dev
