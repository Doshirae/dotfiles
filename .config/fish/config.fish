alias ls="ls --group-directories-first --color=auto"
alias s="startx"
alias wttr='curl wttr.in/"la grande motte"'
alias area="sleep 1; and scrot '%Y-%m-%d_%H:%M:%S[Area].png' -z -s -e 'mv $f ~/Screenshots/'"
alias vfish="vim ~/dotfiles/.config/fish/config.fish"
alias vi3="vim ~/dotfiles/.config/i3/config"
alias vvim="vim ~/dotfiles/.vimrc"
alias vtermite="vim ~/dotfiles/.config/termite/config"
alias gc="git commit -a; and git push"

export EDITOR=/usr/bin/vim
fish_vi_key_bindings
set -g theme_display_vi yes

#set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
#set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
#set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
#set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
#set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
#set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
#set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline
