#!/bin/bash

mkdir -p ~/test &&
{
        echo "Catalog test was created successfully"> ~/report.txt
        touch ~/test/ScriptWasCreatedSuccessfully-$(date +"%d.%m_%H:%M:%S")
}

ping http://www.nikogo_net.ru  || echo $(date +"%d.%m_%H:%M:%S")' invalid connection' >> ~/report.txt