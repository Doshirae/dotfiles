#!/bin/bash

scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshot.png
i3lock -fti /tmp/screenshot.png
