#!/bin/bash

trash=~/.trash
trashlog=~/.trash.log
filename=$1

if [[ $# != 1 ]]; then
      echo "Argument exception: need 1 argument to be passed"
      exit 1
fi

if [[ ! -d  $trash ]]; then
        echo "Cant find 'trash' directory"
        exit 1
fi

if [[ ! -f $trashlog ]]; then
        echo "Cant find 'trash.log' file"
        exit 1
fi

restoreFile() {
    path=$1
    file=$2
    ln $trash/$file $path
}

grep $filename $trashlog |
while read filepath; do
        file=$(echo $filepath | cut -d " " -f 1)
        version=$(echo $filepath | cut -d " " -f 2)
        echo "Restore $version version? (y/n)"
        read answer < /dev/tty
        if [[ $answer == "y" ]]; then
                dir=$(dirname $file) &&
                if [[ -d $dir ]]; then
                        $(restoreFile $file $version)
                else
                        $(restoreFile $HOME/$filename $version) &&
                        echo "Restored in home directory"
                fi &&
                rm $trash/$version && {
                        sed -i "#$filepath#d" $trashlog
                        echo "$file restored"
                }
        fi
done