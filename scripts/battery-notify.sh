#!/usr/bin/env bash
if [[ ! -f /tmp/state ]]; then
	acpi -b | cut -d : -f 2 | cut -d , -f 1 > /tmp/state
fi

oldstate=$(cat /tmp/state)
state=$(acpi -b | cut -d : -f 2 | cut -d , -f 1) # Charging or Discharging

#       get bat | take percent  | remove the last char (%)
level=$(acpi -b | cut -d , -f 2 | rev | cut -c 2- | rev) # Percentage

# charging -> discharging
if [[ ${#state} -gt ${#oldstate} ]]; then
	if [[ $level -eq 100 ]]; then
		notify-send -u low "Batterie pleine"
	else
		notify-send -u low "$state"
	fi
	# discharging -> charging
elif [[ ${#state} -lt ${#oldstate} ]]; then
	notify-send -u low "$state"
fi

if [[ "$state" = " Discharging" ]]; then
	if [[ $level -lt 10 ]]; then
		notify-send -u critical "Branche ton PC. Vite." "$level%"
	elif [[ $level -lt 20 ]]; then
		notify-send -u normal "Batterie faible" "$level%"
	fi
fi

echo "$state" > /tmp/state
