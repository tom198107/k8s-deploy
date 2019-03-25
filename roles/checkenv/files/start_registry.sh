#!/bin/bash
docker run -it -d --name registry -p 5000:5000 -v /opt/docker/config.yml:/opt/docker/config.yml -v /registry-data01:/var/lib/registry registry:2.5.2   /opt/docker/config.yml
