unless File.exist? "/tmp/state"
  File.open("/tmp/state", 'w') {|f| f.write `acpi -b | cut -d : -f 2 | cut -d , -f 1`.strip }
end

oldstate=`cat /tmp/state`
state=`acpi -b | cut -d : -f 2 | cut -d , -f 1`.strip # Charging or Discharging
level=`acpi -b | cut -d , -f 2`.to_i # Percentage

if state != oldstate
  if level >= 98
    `notify-send -u low "Batterie pleine"`
  else
    `notify-send -u low "#{state}"`
  end
end

if state == "Discharging"
  if level < 10
    `notify-send -u critical "Branche ton PC. Vite." "$level%"`
  elsif level < 20
    `notify-send -u normal "Batterie faible" "$level%"`
  end
end

File.open("/tmp/state", 'w') {|f| f.write state}
