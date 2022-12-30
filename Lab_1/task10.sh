#!/bin/bash

man bash | grep -o "[a-zA-Z]\{4,\}" | sort | uniq -c | sort -r -n | head -3