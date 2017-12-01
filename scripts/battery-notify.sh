if [[ ! -f /tmp/check1 ]]; then
	echo "true" > /tmp/check1
fi

if [[ ! -f /tmp/check2 ]]; then
	echo "true" > /tmp/check2
fi

#oldstate=$(cat /tmp/state)
state=$(acpi -b | cut -d : -f 2 | cut -d , -f 1) # Charging or Discharging
# if state ≠ oldstate → notify-send state

#       get bat | take percent  | remove the last char (%)
level=$(acpi -b | cut -d , -f 2 | rev | cut -c 2- | rev) # Percentage

check1=$(cat /tmp/check1)
check2=$(cat /tmp/check2)
case $state in
	*Discharging*)
		if [[ $level -lt 20 ]] && $check1 ; then
			notify-send -u normal "Batterie faible" "$level%"
			$check1 = false
		elif [[ $level -lt 10 ]]; then
			notify-send -u critical "Branche ton PC. Vite." "$level%"
			$check2 = false
		fi
		;;
	*Charging*)
		if $check2; then
			# notify-send "Charging"
			echo "false" > /tmp/check2
		fi
		;;
esac
echo "$check2"
