#!/bin/bash
number=5

if [ "$number" -lt 5 ]; then
  echo "$number is less than 5"
elif [ "$number" -gt 5 ]; then
  echo "$number is greater than 5"
else
  echo "$number is equal to 5"
fi
