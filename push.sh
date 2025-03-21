#!/bin/bash

set -e

docker build -t theodoreniu/devcontainer:latest .
docker push theodoreniu/devcontainer:latest
