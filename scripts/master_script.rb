# battery_notify ==>
$state = `acpi -b | awk '{ print $3 }'`[0..-3]
def battery_notify
	oldstate = $state
	newstate, percentage = %x(acpi | awk '{ print $3 $4 }')[0..-3].split ","
	percentage = percentage.to_i

	if newstate != oldstate
		if percentage >= 98
			`notify-send -u low "Batterie pleine"`
		else
			`notify-send -u low "#{newstate}"`
		end
	end

	if newstate == "Discharging"
		if percentage <= 10
			# `xdotool key ctrl+space`
			`notify-send -u critical "Branche ton PC. Vite." "#{percentage}%"`
		elsif percentage <= 20
			# `xdotool key ctrl+space`
			`notify-send -u normal "Batterie faible" "#{percentage}%"`
		end
	end

	$state = newstate
end
# <==

# wallpaper ==>
$changed = false
$daytime = "rien"
def wallpaper
	hour = Time.now.hour

	matin = (5..11)
	midi = (12..15)
	aprem = (16..21)
	nuit = [22, 23, 0, 1, 2, 3, 4]

	if matin.include? hour and $daytime != "matin"
		$daytime = "matin"
		$changed = true
	elsif midi.include? hour and $daytime != "midi"
		$daytime = "midi"
		$changed = true
	elsif aprem.include? hour and $daytime != "aprem"
		$daytime = "aprem"
		$changed = true
	elsif nuit.include? hour and $daytime != "nuit"
		$daytime = "nuit"
		$changed = true
	end

	if $changed
		files = %x(ls $HOME/.dotfiles/i3/backgrounds/*-#{$daytime}*).split "\n"
		bg = files.shuffle.first
		if rand < 0.1
			`feh --bg-scale $HOME/.dotfiles/i3/backgrounds/hackerman.jpg`
		else
			`feh --bg-scale #{bg}`
		end

		$changed = false
	end
end
# <==

# kanban_todo ==>
def kanban_todo
	out = `awk -F , '{ print $1 ", " $2 ", " $3 }' ~/.kanban.csv | sed 's/"//g'` # recup le tag + truc à faire
	out = out.split("\n")                                         # Formatage
	out.shift                                                     # On se fiche de la première ligne, c'est le titre des colonnes

	out = out.map { |line| line.split(",") }                      # On sépare les lignes pour avoir un tableau à 2 dimensions
		.reject { |line| line[1] == "T" }                           # On dégage une ligne inutile
		.select { |line| line[0] == "TODO" }                        # On garde que ce qui est TODO
	out.map(&:shift)                                              # On dégage les titres, dtf c'est forcément TODO
	out = out.group_by { |line| line[0] }                         # On regroupe par tag

	File.open("/home/doshirae/.todo.md", 'w') do |file|
		out.each_key do |key|
			file.write "#{key.strip.capitalize} :\n"                  # On écrit le tag avec la 1ère lettre en majuscule
			things = out[key].flatten.reject { |item| item == key }   # On récup les items correspondant au tag
			things.each do |thing|
				file.write "   -#{thing}\n"                             # On écrit les tags un a un
			end
		end
	end
  %x(notify-send "Trucs à faire" "$(cat ~/.todo.md)")
end
# <==

loop do
	if %x(date +"%M%S").to_i == 10  # toutes les heures, à 10s (heure : Xh00m10s)
		kanban_todo()
	end
	wallpaper()
	battery_notify()
	sleep(5)
end
