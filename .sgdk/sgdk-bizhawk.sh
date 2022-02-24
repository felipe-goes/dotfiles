#!/usr/bin/bash

docker run --rm -v "$PWD":/m68k -t registry.gitlab.com/doragasu/docker-sgdk:v1.70 \
    && bizhawk "$PWD"/out/rom.bin
