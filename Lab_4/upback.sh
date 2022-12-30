#!/bin/bash

HOME="/home/user"
LastBackupDate=$(ls $HOME | grep -E "^Backup-" | sort -n | tail -1 | sed 's/^Backup-//')
LastBackup="$HOME/Backup-${LastBackupDate}"

if [[ -z "$LastBackupDate" ]];
then
        echo "Backup not found Exception"
        exit 1
fi

if [[ ! -d $HOME/restore ]];
then
        mkdir $HOME/restore
else
        rm -r $HOME/restore
        mkdir $HOME/restore
fi

for Fi in $(ls $LastBackup | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$");
do
        cp "${LastBackup}/${Fi}" "$HOME/restore/${Fi}"
        echo "Success!"
done