#!/bin/bash


count=1


mkdir -p ../../../../multi-nostreply
rm -f -r ../../../../multi-nostreply/*

while read line; do
    cp -r "../../../../nostreply" "../../../../multi-nostreply/nostreply$count"
    echo $line > "../../../../multi-nostreply/nostreply$count/config/ASK-MESSAGE"
    count=$((count+1))
done < "../../../config/ASK-MESSAGE-LIST"

cd ../../../../multi-nostreply
for d in ./* ; do
    echo "Launching $d"
    cd $d/src/scripts/crawl-and-reply
    x-terminal-emulator -e ./crawl-and-reply-multi.sh &
    sleep 1
    cd ../../../../
done


