#!/bin/bash
mkdir -p data
docker run \
	--name paper-mc \
	--rm \
	-d \
	-e MEMORY_SIZE=2500M \
	-v ${PWD}/data:/data \
	-p 25565:25565 \
	-it \
	papermc

