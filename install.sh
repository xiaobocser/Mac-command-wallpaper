#!/bin/bash

path=$(dirname `readlink -f $0`)
export PATH=$PATH:$path
echo "export PATH=\$PATH":$path >> ~/.bash_profile
