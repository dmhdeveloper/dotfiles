#!/bin/bash

CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`
FREE_MEM=`free -m | awk 'NR==2' | awk '{print ((($2-$7) / $2)*100);}'`

printf " ﬙ %.f%%   %.f%%" $CPU $FREE_MEM
