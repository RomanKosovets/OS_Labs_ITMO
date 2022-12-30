#!/bin/bash

ps -u $USER -o pid,command | tail -n +2 | awk '{print $1":"$2}'> ans
echo "Count:" $(wc -l ans)
cat ans
