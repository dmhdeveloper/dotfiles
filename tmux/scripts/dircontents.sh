#!/bin/bash

shopt -s nullglob dotglob     # To include hidden files
DIR=""
for filename in $(ls -a $1)
do
case $filename in
  *.conf) DIR=$DIR" ";;
  *.go) DIR=$DIR" ";;
  *.class) DIR=$DIR" ";;
  *.js) DIR=$DIR" ";;
  *.md) DIR=$DIR" ";;
  *Dockerfile*) DIR=$DIR" ";;
esac
done

printf "%s" $DIR
