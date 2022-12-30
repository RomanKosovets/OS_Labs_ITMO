#!/bin/bash

ps -e -o pid,command | grep -E "/sbin/" | awk '{print $1}'