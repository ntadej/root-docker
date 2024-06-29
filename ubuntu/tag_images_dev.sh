#!/bin/bash

docker tag ntadej/root-ubuntu:6.28.08-py3-dev ntadej/root-ubuntu:6.28.08-dev
docker tag ntadej/root-ubuntu:6.28.08-py3-dev ntadej/root-ubuntu:6.28-py3-dev
docker tag ntadej/root-ubuntu:6.28.08-py3-dev ntadej/root-ubuntu:6.28-dev

docker tag ntadej/root-ubuntu:6.28.04-py3-dev ntadej/root-ubuntu:6.28.04-dev
docker tag ntadej/root-ubuntu:6.28.00-py3-dev ntadej/root-ubuntu:6.28.00-dev

docker tag ntadej/root-ubuntu:6.28-py3-dev ntadej/root-ubuntu:latest-py3-dev

docker tag ntadej/root-ubuntu:latest-py3-dev ntadej/root-ubuntu:latest-dev
