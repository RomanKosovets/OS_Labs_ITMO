#!/bin/bash

read nameFile
if [[ "$nameFile" != "file1" ]]
then
        echo "FileNameException"
        exit 1
else
        cp file1 fileCopy-$(date +%d"_"%m"_"%y)
fi
