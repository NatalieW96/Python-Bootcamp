#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Hello, stranger!"
else
  for name in "$@"
  do
    echo "Hello, $name!"
  done
fi

