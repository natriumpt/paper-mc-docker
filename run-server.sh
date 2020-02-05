#!/bin/bash
mkdir -p data
docker run \ 
    --name paper-mc \
    --rm \
    -d \
    -v ${PWD}/data:/data \
    papermc
