#!/bin/bash
# Public Domain
# (someone claimed the next lines would be useful for…
#  people. So here goes: © 2012 Stefan Breunig
#  stefan+measure-net-speed@mathphys.fsk.uni-heidelberg.de)

# append i3status output to the measure-net-speed’s one.
# the quote and escape magic is required to get valid
# JSON output, which is expected by i3bar (if you want
# colors, that is. Otherwise plain text would be fine).
# For colors, your i3status.conf should contain:
# general {
#   output_format = i3bar
# }

# i3 config looks like this:
# bar {
#   status_command measure-net-speed-i3status.bash
# }


i3stat=$(i3status);

if [ -f /tmp/eti3bar ]
then
	str=",";
else
	str="";
	echo "1" >> /tmp/eti3bar;
fi

dat="["
mounts=`cat /proc/mounts | grep /media | cut -d " " -f2`
for mnt in $mounts
do
	match="\\\040";
	repl=" ";
	mnt=${mnt/$match/$repl};
	fs=`df "$mnt" -h | tail -n1 | awk '{print $4}'`
	mnt=${mnt/\/media\//}
	dat="$dat {\"color\": \"#484848\",\"full_text\": \"$mnt: ${fs}B\"}, "
done 
echo "$str${i3stat/[/$dat}" || exit 1
