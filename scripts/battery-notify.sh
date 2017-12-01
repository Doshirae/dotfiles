# echo "" # Otherwise there is an annoying message on the bar
if [[ ! -f /tmp/state ]]; then
	echo `acpi -b | cut -d : -f 2 | cut -d , -f 1` > /tmp/state
fi

oldstate=$(cat /tmp/state)
state=$(acpi -b | cut -d : -f 2 | cut -d , -f 1) # Charging or Discharging

#       get bat | take percent  | remove the last char (%)
level=$(acpi -b | cut -d , -f 2 | rev | cut -c 2- | rev) # Percentage

if [[ $state != $oldstate ]]; then
	notify-send -u low "$state"
fi

case $state in
	*Discharging*)
		if [[ $level -lt 10 ]]; then
			notify-send -u critical "Branche ton PC. Vite." "$level%"
		elif [[ $level -lt 20 ]]; then
			notify-send -u normal "Batterie faible" "$level%"
		fi
		;;
esac

echo "$state" > /tmp/state
