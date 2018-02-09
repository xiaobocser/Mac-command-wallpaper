#!/bin/bash

#获得随机数返回值，shell函数里算出随机数后，更新该值
function random()
{
    max=$1
    num=$(date +%s)
    ((retnum=num%max+1))
    echo $retnum
}

max_c=`ls background | wc -l`
random_val=$(random $max_c)

ls background | sed -n "${random_val}p"
