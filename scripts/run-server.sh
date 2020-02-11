#!/bin/bash
mkdir -p data
docker run \
	--name paper-mc \
	--rm \
	-d \
	-v ${PWD}/data:/data \
	-p 25565:25565 \
	-it \
	papermc

