#!/bin/bash

trash=~/.trash
trashlog=~/.trash.log
filename=$1
counter=0

if [ $# != 1 ]; then
    exit 1
fi

if [ ! -d $trash ]; then
    mkdir $trash
fi

if [ ! -f $trashlog ]; then
    touch $trashlog
fi

nameInTrash=$filename'_'$counter
while [ -f $trash/$nameInTrash ]; do
    (( counter++ ))
    nameInTrash=$filename'_'$counter
done

ln $filename $trash/$nameInTrash
rm $filename && echo $(realpath $filename) $nameInTrash >> $trashlog