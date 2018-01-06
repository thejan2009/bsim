#!/usr/bin/env bash

# folder=$1
folder=../coupled-ab/2018-01-06_14-26-45

find $folder -name 'results' -type f -exec cat {} \; > tmp.txt
ind=0
tmp=""
txt=""
for i in $(cut tmp.txt -d' ' -f2); do
    tmp="${tmp},$i";
    ind=$((ind+1));
    if [ 0 == $((ind%4)) ]; then
        ind=0;
        txt="${txt}${tmp}\n"
        tmp=""
    fi
done

echo "z,alpha,beta,amplitude,period" > coalesced.csv
echo -e $txt >> coalesced.csv
