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


i3status | while :
do
    read i3stat
    dat=""
    mounts=`cat /proc/mounts | grep /media | cut -d " " -f2`
    music=`/home/efux/Documents/dev/i3-gmusic/get_song.sh`
    message=`/home/efux/Documents/dev/i3-message/get_message.sh`
    for mnt in $mounts
    do
        match="\\\040";
        repl=" ";
        mnt=${mnt/$match/$repl};
        fs=`df "$mnt" -h | tail -n1 | awk '{print $4}'`
        mnt=${mnt/\/media\//}
        dat="$dat {\"color\": \"#484848\",\"full_text\": \"$mnt: ${fs}B\"}, "
    done 
    echo "${i3stat/[/ [$message $music $dat}"
done
