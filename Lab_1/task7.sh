#!/bin/bash

grep -E -o -s -h "[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.-]+\.[a-zA-Z]{2,6}" /etc/* | tr " " "\n" > emails.lst