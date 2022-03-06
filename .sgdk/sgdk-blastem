#!/usr/bin/bash

docker run --rm -v "$PWD":/m68k -t \
    registry.gitlab.com/doragasu/docker-sgdk:v1.70 &&
    blastem "$PWD"/out/rom.bin
