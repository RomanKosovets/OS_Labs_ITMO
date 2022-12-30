#!/bin/bash

echo -e "------WELCOME------\n      Menu      \n"
echo -e "1)Запустить nano\n2)Запустить vi\n3)Запустить links\n4) Выйти"
echo -e "Выберите пункт"

read menu
case $menu in
1)
        nano ;;
2)
        vi ;;
3)
        links ;;
4)
        exit 0 ;;
esac