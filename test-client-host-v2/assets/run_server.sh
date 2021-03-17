#!/bin/bash

docker pull nginx
docker run --name docker-nginx -p 8080:80 nginx
