#!/bin/bash
for i in {1..10}
do
  echo "Count: $i"
  if [ "$i" -eq 5 ]; then
    echo "Halfway there!"
  fi
done

