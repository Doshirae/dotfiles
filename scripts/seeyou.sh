#!/usr/bin/env bash

# SEE YOU SPACE COWBOY by DANIEL REHN (danielrehn.com)
# Displays a timeless message in your terminal with cosmic color effects

# Usage: add "sh ~/seeyouspacecowboy.sh; sleep 2" to .bash_logout (or similar) in your home directory
# (adjust the sleep variable to display the message for more seconds)

# Cosmic color sequence

ESC_SEQ="\x1b[38;5;"
esc="\e["
col_01=$esc"1;31m"
col_02=$col_01
col_03=$col_01
col_04=$col_01
col_05=$esc"1;33m"
col_06=$col_05
col_07=$col_05
col_08=$col_05
col_09=$esc"1;32m"
col_10=$col_09
col_11=$col_09
col_12=$col_09
col_13=$esc"1;36m"
col_14=$col_13
col_15=$col_13
col_16=$col_13
col_17=$esc"1;34m"
col_18=$col_17
col_19=$esc"1;35m"
col_20=$col_19
col_21=$col_19
RESET="\033[m"

# Timeless message

printf "$col_01  .d8888b.  8888888888 8888888888      Y88b   d88P  .d88888b.  888     888  \n"
printf "$col_02 d88P  Y88b 888        888              Y88b d88P  d88P\" \"Y88b 888     888  \n"
printf "$col_03  \"Y888b.   8888888    8888888            Y888P    888     888 888     888  \n"
printf "$col_04     \"Y88b. 888        888                 888     888     888 888     888  \n"
printf "$col_05       \"888 888        888                 888     888     888 888     888  \n"
printf "$col_06 Y88b  d88P 888        888                 888     Y88b. .d88P Y88b. .d88P  \n"
printf "$col_07  \"Y8888P\"  8888888888 8888888888          888      \"Y88888P\"   \"Y88888P\"  \n"
printf "$col_08  .d8888b.  8888888b.     d8888  .d8888b.  8888888888    \n"
printf "$col_09 d88P  Y88b 888   Y88b   d88888 d88P  Y88b 888       \n"
printf "$col_10  \"Y888b.   888   d88P d88P 888 888        8888888    \n"
printf "$col_11     \"Y88b. 8888888P\" d88P  888 888        888   \n"
printf "$col_12       \"888 888      d88P   888 888    888 888    \n"
printf "$col_13 Y88b  d88P 888     d8888888888 Y88b  d88P 888  \n"
printf "$col_14  \"Y8888P\"  888    d88P     888  \"Y8888P\"  8888888888     \n"
printf "$col_15  .d8888b.   .d88888b.  888       888 888888b.    .d88888b. Y88b   d88P     \n"
printf "$col_16 d88P  Y88b d88P\" \"Y88b 888   o   888 888  \"88b  d88P\" \"Y88b Y88b d88P   \n"
printf "$col_17 888        888     888 888 d888b 888 8888888K.  888     888   Y888P    \n"
printf "$col_18 888        888     888 888d88888b888 888  \"Y88b 888     888    888    \n"
printf "$col_19 888    888 888     888 88888P Y88888 888    888 888     888    888  \n"
printf "$col_20 Y88b  d88P Y88b. .d88P 8888P   Y8888 888   d88P Y88b. .d88P    888  \n"
printf "$col_21  \"Y8888P\"   \"Y88888P\"  888P     Y888 8888888P\"   \"Y88888P\"     888\n"
printf "$RESET" # Reset colors to "normal"

