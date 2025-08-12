#!/bin/bash
i=1
while [ $i -le 10 ]
do
  echo "Count: $i"
  if [ "$i" -eq 5 ]; then
    echo "Halfway there!"
  fi
  i=$((i + 1))
done
