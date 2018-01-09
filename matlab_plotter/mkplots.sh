#!/usr/bin/env bash

folder=$1
# folder=../coupled-ab/2018-01-06_14-26-45

for j in $folder/10; do
    for i in $j/*; do
        echo $i;
        a=${i##*/};
        a=${a#alpha-};
        echo "alpha ${a%-beta*}" > $i/results
        echo "beta ${a#*beta-}" >> $i/results
        octave p.m $i/lacI_ALL.csv $i/lacl lacI >> $i/results
    done
done
