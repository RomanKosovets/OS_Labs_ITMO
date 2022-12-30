#!/bin/bash

tail -f pipe |
while true;
do
        read line
        echo "$line" "Купи коня, хороший конь, богатырский"
done