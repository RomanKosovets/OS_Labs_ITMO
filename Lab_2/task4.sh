#!/bin/bash

for pid in $(ps -A -o pid | tail -n +2)
do
        status="/proc/"$pid"/status"
        sched="/proc/"$pid"/sched"

        if [[ -f $status && -f $sched ]]
        then
                ppid=$(grep -s -E "PPid" $status | awk '{print $2}')
                sum_exec_runtime=$(grep "se\.sum_exec_runtime" $sched | awk '{print $3}')
                nr_switches=$(grep "nr_switches" $sched | awk '{print $3}')
                art=$(echo $sum_exec_runtime $nr_switches | awk '{print $1 / $2}')
                echo "$pid $ppid $art"
        fi
done | sort -nk2 | awk '{print "processID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > test4.out