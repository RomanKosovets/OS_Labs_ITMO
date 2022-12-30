#!/bin/bash

declare -a array

counter=0
echo "" > report.log

while true;
do
    array+=(1 2 3 4 5 6 7 8 9 10)
    let counter++
    if [[ $counter -eq 100000 ]]
    then
        counter=0
        echo "${#array[@]}" >> report.log
    fi
done


