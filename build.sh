#!/bin/bash
docker build -t griandev .
docker save -o griandev.tar griandev
