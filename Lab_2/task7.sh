#!/bin/bash

start_data=()
end_data=()

pids=()
cmdline=()

:>ans7

for pid in $(ps -axo pid | tail -n +2)
do
        if [[ -r /proc/$pid/io ]]
        then
                start_data[$pid]=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')
                pids[$pid]=$pid
                cmdline[$pid]=$(cat /proc/$pid/cmdline | tr -d '\0')
        fi
done

echo "First part done"
echo "Wait..."

sleep 5

for pid in "${pids[@]}"
do
        end_data[$pid]=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')
        diff=$(echo "${end_data[$pid]} - ${start_data[$pid]}" | bc)
        echo $pid $diff ${cmdline[$pid]} >> ans7
done

sort -n -r -k 2 ans7 | head -3 | awk '{print $1":"$2":"$3}'