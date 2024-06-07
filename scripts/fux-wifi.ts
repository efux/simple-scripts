#!/usr/bin/env ts-node
import {execSync} from 'child_process';

const wifis = execSync("nmcli --fields BARS,BSSID,IN-USE,SSID dev wifi list", {encoding: 'utf8'})
    .split('\n')
    .slice(1)
    .filter(line=>line);

const choice = execSync(`printf "${wifis.join('\n')}" | rofi -dmenu -i -l 20 -p 'Connect to wifi' -theme dmenu_vertical`, {encoding: 'utf8'});

if (!!choice) {
    const bssid = choice.split(' ').slice(2, 3);
    execSync(`nmcli device wifi connect ${bssid}`);
} else {
    console.log('Program terminated without a choice.');
}

