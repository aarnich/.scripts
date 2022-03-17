#!/usr/bin/env bash

for VARIABLE in $($1)
do
  $2 $VARIABLE
done


