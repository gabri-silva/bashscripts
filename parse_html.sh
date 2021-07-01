#!/bin/bash
if [ "$1" == "" ]
then
        echo "use: $0 site"
else
        wget $1
        cat index.html | grep "href" | cut -d "/" -f3 | cut -d '"' -f1 | grep -v '<l' | grep '\.' > domains.txt
        for d in $(cat domains.txt);do host $d | grep "has address" | sort -u;done
fi
