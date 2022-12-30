#!/bin/bash

./mem.bash&pid0=$!

echo "" > top5_data
echo "" > membash_data
echo "" > mem_data
echo "" > swap_data

while true;
do
        top -b -n1 | sed -n 4p >> mem_data
        top -b -n1 | sed -n 5p >> swap_data
        top -bn1 > .tmp
        cat .tmp | head -12 | tail -5 >> top5_data
        echo "--------" >> top5_data
        cat .tmp | grep "mem[2]*.bash" >> membash_data
done
