#!/bin/bash
mkdir $2
shopt -s globstar
for file in $1/**
do
  mirror=$2${file:${#1}};
  if [ -d "$file" ]
  then
    mkdir $mirror;
  else
    convert -define jpeg:size=200x200 $file -thumbnail 100x100^ -gravity center -extent 100x100 $mirror
  fi
done

