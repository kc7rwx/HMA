#!/bin/sh

cat hma_server_list.csv | grep ,$1, | while read LINE
do
  SERVER=$LINE;
  IP=$(echo $LINE|awk -F, '{print $1}');
  PING=$(ping $IP -c3|grep round-trip|awk '{print $4}'|awk -F/ '{print $1","$2","$3}');
  echo $SERVER,$PING;
 # echo $OUTPUT;
done

