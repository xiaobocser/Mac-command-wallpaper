#!/bin/bash

path=$(dirname `readlink -f $0`)
export PATH=$PATH:$path
echo "\$PATH":$path >> ~/.bash_profile
