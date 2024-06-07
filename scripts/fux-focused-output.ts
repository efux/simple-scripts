#!/usr/bin/env ts-node
import {execSync} from 'child_process';

interface Output {
	focused: boolean;
	name: string;
}

const outputList = JSON.parse(execSync('swaymsg -t get_outputs', {encoding: 'utf8'}))

const focusedOutput = outputList.find((output: Output) => output.focused).name;
const otherOutputs = outputList.filter((output: Output) => !output.focused).map((output: Output) => output.name)

console.log(otherOutputs);
console.log(focusedOutput);


