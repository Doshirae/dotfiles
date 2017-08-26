#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $@" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $@" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $@" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

cleanup() {
	# Remove temporary files
	# Restart services
	# ...
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
	trap cleanup EXIT
	cd ~/diapos
	slide=${1:-"slide"}
	cat ~/.dotfiles/templates/slide-top.html > $slide.html
	cat $slide.md >> $slide.html
	cat ~/.dotfiles/templates/slide-bottom.html >> $slide.html
fi

