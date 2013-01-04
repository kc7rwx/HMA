#!/bin/bash

cat hma_server_list.csv | grep ,$1, | while read LINE
do
  IP=$(echo $LINE | awk -F, '{print $1}');
  PING_TIME=$(ping $IP -c3|grep rtt);
  OUTPUT=$LINE$PING_TIME;
  echo $OUTPUT;
done

