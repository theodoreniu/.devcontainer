#!/bin/bash

set -e

docker build -t theodoreniu/devcontainer:latest .
docker push theodoreniu/devcontainer:latest

date_tag=$(date +%Y%m%d)
docker tag theodoreniu/devcontainer:latest theodoreniu/devcontainer:$date_tag
docker push theodoreniu/devcontainer:$date_tag

echo "Pushed to Docker Hub with date tag: $date_tag"