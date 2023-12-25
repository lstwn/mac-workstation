#!/bin/bash

# build a docker image
docker build --tag ubuntu -f ubuntu.dockerfile .

# run a docker container
docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) ubuntu