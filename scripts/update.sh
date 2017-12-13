#!/usr/bin/env bash
updates=$(checkupdates | wc -l)
if [[ $updates -gt 1 ]]; then
	notify-send "Updates" "Il y a $updates mises à jour disponibles."
elif [[ $updates -eq 1 ]];then
	notify-send "Updates" "Il y a $updates mise à jour disponible."
else
	notify-send "Updates" "Pas de mise à jour"
fi
