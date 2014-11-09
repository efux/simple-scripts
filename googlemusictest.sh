#!/bin/bash

id=$(xwininfo -root -children | grep "Google Play Music" | awk '{ print $1 }');

for chromiumInstance in $id
do
	echo $chromiumInstance
	winname=$(xprop -id $chromiumInstance | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2'"')
	echo $winname;
done

