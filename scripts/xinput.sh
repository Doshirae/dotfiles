#!/usr/bin/env bash
dev=$(xinput | grep "Touchpad" | sed 's/.*id=\([0-9]*\).*/\1/')
tap_enabled=$(xinput list-props $dev | grep "Tapping Enabled (" | sed 's/.*(\(.*\)).*/\1/')
xinput set-prop $dev $tap_enabled 1
typing_enabled=$(xinput list-props $dev | grep "Disable While Typing Enabled (" | sed 's/.*(\(.*\)).*/\1/')
xinput set-prop $dev $typing_enabled 0
