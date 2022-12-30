#!/bin/bash

privious_ppid=-1
max=0
max_pid=0
for pid in $(ps -A -o pid | tail -n +2)
do
        path_statm="/proc/"$pid"/statm"
        if [[ -f $path_statm ]]
        then
                new=$(awk '{print $1}' $path_statm)
                if [[ "$max" -lt "$new" ]]
                then
                        max=$new
                        max_pid=$pid
                fi
        fi
done
echo max_pid = $max_pid and max = $max
