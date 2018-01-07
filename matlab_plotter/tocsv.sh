#!/usr/bin/env bash

folder=$1

find $folder -name 'results' -type f -exec cat {} \; > tmp.txt
ind=0
tmp="${2}"
txt=""
for i in $(cut tmp.txt -d' ' -f2); do
    tmp="${tmp},$i";
    ind=$((ind+1));
    if [ 0 == $((ind%4)) ]; then
        ind=0;
        txt="${txt}${tmp}\n"
        tmp="${2}"
    fi
done

echo "population,alpha,beta,amplitude,period" > coalesced${2}.csv
echo -e $txt >> coalesced${2}.csv
