#!/bin/bash
echo $1 >> /home/efux/test.log
line=`wmctrl -lp | cut -d' ' -f4 | grep -n $1 | cut -d: -f1 | tail -n1`;
name=`wmctrl -lp | head -n$line | tail -n1 | cut -d' ' -f6-1000`
echo $name >> /home/efux/test.log

ps aux | grep $1 >> /home/efux/test.log
wmctrl -r "profanity" -b add,demands_attention
