alias ls="ls --group-directories-first --color=auto"
alias s1="startx ~/dotfiles/.xinitrc i3"
alias s2="startx ~/dotfiles/.xinitrc xfce"
alias wttr='curl wttr.in/"la grande motte"'
alias area="sleep 1; and scrot '%Y-%m-%d_%H:%M:%S[Area].png' -z -s -e 'mv $f ~/Screenshots/'"
alias vfish="vim ~/dotfiles/.config/fish/config.fish"
alias vi3="vim ~/dotfiles/.config/i3/config"
alias vvim="vim ~/dotfiles/.vimrc"
alias vtermite="vim ~/dotfiles/.config/termite/config"
alias gc="git commit -a; and git push"

export EDITOR=/usr/bin/vim
export GOPATH=$HOME/.Go
fish_vi_key_bindings
set -g theme_display_vi yes

