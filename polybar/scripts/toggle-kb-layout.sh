#! /bin/bash

if [ ! "$(setxkbmap -query | grep "layout:     de")" ]; then
	setxkbmap -layout de
else
	setxkbmap -layout us
fi
