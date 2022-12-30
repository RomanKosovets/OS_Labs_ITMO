#!/bin/bash

mkfifo pipe
sh handler.sh & sh gen.sh
rm pipe