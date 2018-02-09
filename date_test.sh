#!/bin/bash
os=$(uname -s)
if [[ "$os" == "Linux" ]]; then
    date +%Y-%m-%d --date='-1 day -1 year'
elif [[ "$os" == "Darwin" ]]; then
    date -v-1d -v-1y +%Y-%m-%d
else
    echo "unknown OS"
    exit 1
fi
