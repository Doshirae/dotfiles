source "$HOME/.zsh/slimzsh/slim.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-history-substring-search.zsh"
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
	source ~/.config/exercism/exercism_completion.zsh
fi

autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# User configuration
export PATH="$PATH:/usr/lib/ccache/bin/:/usr/bin:/usr/local/bin:.:$HOME/.gem/ruby/2.4.0/bin:$HOME/.bin:$HOME/.dotfiles/scripts/"
export KEYTIMEOUT=1
export GTK_IM_MODULE="xim"
export SSH_KEY_PATH="~/.ssh/id_rsa"
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

zmodload zsh/complist
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Aliases ==>
alias tree="tree --dirsfirst"
alias vzsh="vim ~/.dotfiles/zshrc"
alias vi3="vim ~/.dotfiles/i3/config"
alias vvim="vim ~/.dotfiles/vimrc"
alias vterm="vim ~/.dotfiles/Xresources"
alias vtmux="vim ~/.dotfiles/tmux.conf"
alias virc="vim ~/.dotfiles/irssi.conf"
alias vbar="vim ~/.dotfiles/i3/polybar/polybar.conf"
alias grep="grep --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias l="ls -AlhF"
alias ls="ls --color=auto --group-directories-first -F"
alias exit='sh ~/.dotfiles/seeyouspacecowboy.sh; sleep .5; exit'
alias :wq="exit"
alias ftpiut="sftp chaixr@ftpinfo.iutmontp.univ-montp2.fr"
alias marvin="ssh pi@www.doshirae.fr"
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias flic="nmap -v -Pn -A"
alias pull="git pull origin master"
alias push="git push origin master"
alias backup="sudo rsync -Pvaz --exclude /.cache /home/doshirae/ /run/media/doshirae/TOSHIBA\ EXT/"
alias fucking="sudo"
alias cs="csi -script"
alias cleantex='rm *.{aux,log,toc}'
# <==

# Fonctions ==>
untar (){
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.tar.xz)    tar xJf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1   ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*)           echo "'$1' ne peut etre extrait par untar()" ;;
		esac
	else
		echo "'$1' fichier invalide"
	fi
}

smileys() {
	echo -n "ಠ_ಠ\n ಠᴗಠ\n (¬_¬)\n (¬▂¬)\n （＞д＜）\n (ノಠ益ಠ)ノ\n (^._.^)ﾉ\n (∩_∩)\n (✿◠‿◠)\n ┌(° ͜ʖ͡°)┘\n (⁎❛ᴗ❛⁎)\n (☞ಠ_ಠ)☞\n (｡◕‿‿◕｡)\n ◔‿◔\n (•_•)\n (/ﾟДﾟ)/\n （；¬＿¬)\n (」゜ロ゜)」\n (╯°□°）╯︵ ┻━┻\n щ(ಠ益ಠщ)\n ರ◡ರ\n ಠಿ_ಠ\n 눈_눈\n ʘ︵ʘ\n͡ ° ͜ʖ ͡°\n (；一_一)\n ʕ•ᴥ•ʔ\n ¯\_(ツ)_/¯\n ಥ╭╮ಥ\n ٩(^ᴗ^)۶\n (⋋▂⋌)\n ♥‿♥\n •‿•\n ( ¯◡◡¯)\n (*￣m￣)\n ಠ╭╮ಠ\n ಠ▃ಠ\n ┻━┻ ︵ヽ(\`Д´)ﾉ︵ ┻━┻\n ┬─┬ノ( º _ ºノ)\n (ノಠ益ಠ)ノ彡┻━┻\n 😶\…\n |¯느¯|\n ╰[ ◕ ᗜ ◕]╯\n "
}

test_ex(){
	case $1 in
		ruby)
			ruby -r minitest/pride *_test.rb
			;;
		elixir)
			elixir *_test.exs
			;;
		*)
			echo "Y'a pas ce langage"
			;;
	esac
}
# <==

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

