#! /bin/bash

echo "* * * * * ~/lab3/task1.sh" >> mycron
crontab mycron
rm mycron