#!/bin/bash

docker build --rm -t croncontainer .
docker run -it --rm --name croncontainer -p 3000:22 croncontainer