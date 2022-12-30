#!/bin/bash

sh t4_2.sh & pid1=$!
sh t4_2.sh & pid2=$!
sh t4_2.sh & pid3=$!

echo "$pid1"
echo "$pid2"
echo "$pid3"

renice 10 -p $pid1

at now + 1min <<< "kill ${pid3}"
at now + 2min <<< "kill ${pid1}; kill ${pid2}"