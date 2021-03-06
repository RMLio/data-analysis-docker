#!/usr/bin/env bash

#parent-image
cd parent-image
sudo docker build -t parent .
cd ..

#daro
sudo docker build --build-arg SCRIPT=scripts/daro.sh -t daro .

#s-daro
sudo docker build --build-arg SCRIPT=scripts/s-daro.sh -t s-daro .

#rocker
#sudo docker build --build-arg SCRIPT=scripts/rocker.sh -t rocker .

#rocker-p
#sudo docker build --build-arg SCRIPT=scripts/rocker-p.sh -t rocker-p .

#bst-ua
#sudo docker build --build-arg SCRIPT=scripts/bst.sh -t bst .