#!/bin/bash
docker run \ 
    --name paper-mc \
    --rm \
    -d \
    -v ${PWD}/data:/data \
    papermc
