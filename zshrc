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
export PATH="$PATH:.:/usr/bin:/usr/local/bin:$HOME/.gem/ruby/2.4.0/bin"
# export PATH="$PATH:/usr/local/texlive/2017/bin/x86_64-linux"
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
# alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias s="startx"
alias exit='source ~/.dotfiles/scripts/seeyou.sh; sleep .5; exit'
# file edit
alias vzsh="vim ~/.dotfiles/zshrc"
alias vi3="vim ~/.dotfiles/i3/config"
alias vvim="vim ~/.dotfiles/vimrc"
alias vterm="vim ~/.dotfiles/X/Xresources"
alias vbar="vim ~/.dotfiles/i3/polybar.conf"
# ls
alias ls='exa'
alias ll='exa -l'
alias lll='exa -l | less'
alias lla='exa -la'
alias llt='exa -T'
alias llfu='exa -bghHliS --git'
# ça pipe
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g S='| sort'
alias -g T='tail -f'
alias -g W='| wc -l'
# others
alias cp='cp -R'
alias mkdir='mkdir -p'
alias ping='ping -c 3'
alias tex-clean="rm *.{aux,log,out,pdf}"
alias tree="tree --dirsfirst"
alias grep="grep --color=auto"
alias :wq="exit"
alias ftpiut="sftp chaixr@ftpinfo.iutmontp.univ-montp2.fr"
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias flic="nmap -v -Pn -A"
alias backup="sudo rsync -LPvaz --exclude /.cache /home/doshirae/ /run/media/doshirae/TOSHIBA\ EXT/"
alias howdoi="howdoi -c"
alias writeinclipboard='[[ -x `which xclip 2>/dev/null` ]] && cat << EOF | xclip -selection clipboard '
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

add-feed(){ liferea-add-feed "https://www.youtube.com/feeds/videos.xml?channel_id=$1" }
mcd() { mkdir $1 && cd $1 }
# <==

# Vim ==>
bindkey -v
autoload -U colors && colors
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#Pour pouvoir utiliser les flêches haut et bas pour chercher les commandes dans l'historique
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
#Pour pouvoir utiliser Orig et End sur le clavier pour aller en début/fin de ligne (plus pratique)
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
#Pour utiliser les flêches de gauche et de droite pour se déplacer normalement
bindkey "^[[D" backward-char
bindkey "^[[C" forward-char
#Pour utiliser Suppr
bindkey "^[[3~" delete-char
# <==


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
