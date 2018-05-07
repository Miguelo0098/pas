#!/bin/bash
if [[ $# < 2 ]]; then
	nb=0
else
	nb="$2"
fi
for x in $(find $1 -type f -size +"$nb"c); do
	if [[ -x $1$x ]]; then
		executable=1
	else
		executable=0
	fi
	stat -c "$(basename $x); $(stat -c %U $x | wc -m); %w; %X; %s; %b; %A; $executable" $x
done