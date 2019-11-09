#!/bin/bash

shopt -s nullglob dotglob     # To include hidden files
files=`ls -a $1`
DIR=""
case $files in
  *.conf) DIR=$DIR" ";;
  *.go) DIR=$DIR" ";;
  *.class) DIR=$DIR" ";;
  *.js) DIR=$DIR" ";;
  *.md) DIR=$DIR" ";;
  *Dockerfile*) DIR=$DIR" ";;
esac

printf "%s" $DIR
