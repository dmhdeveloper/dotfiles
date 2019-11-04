#!/bin/bash

case `uname` in
  Darwin)
    CPU=`ps -A -o %cpu | awk '{ cpu += $1} END { printf cpu }'`
    MEMORY_USED=`ps -A -o %mem | awk '{ mem += $1} END { printf mem }'`
  ;;
  Linux)
    CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`
    MEMORY_USED=`free -m | awk 'NR==2' | awk '{print ((($2-$7) / $2)*100);}'`
  ;;
esac

printf " ﬙ %.f%%   %.f%%" $CPU $MEMORY_USED
