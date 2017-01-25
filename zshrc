source "$HOME/.slimzsh/slim.zsh"
# User configuration
export PATH="/usr/bin"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set editor to vim
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias vi="nvim"
alias vzsh="nvim /home/doshirae/.dotfiles/zshrc"
alias vi3="nvim /home/doshirae/.dotfiles/i3/config"
alias vvim="nvim /home/doshirae/.dotfiles/nvim/init.vim"
alias vterm="nvim /home/doshirae/.dotfiles/Xresources"
alias vtmux="nvim /home/doshirae/.dotfiles/tmux.conf"
alias virc="nvim /home/doshirae/.dotfiles/irssi.conf"
alias grep="grep --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias l="ls -AlhF"
alias ls="ls --color=auto --group-directories-first"
alias exit='sh ~/.dotfiles/seeyouspacecowboy.sh; sleep .5; exit'
alias ftpiut="sftp chaixr@ftpinfo.iutmontp.univ-montp2.fr"
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias flic="nmap -v -Pn -A"
alias pull="git pull origin master"
alias push="git push origin master"

ex (){
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' ne peut etre extrait par ex()" ;;
    esac
  else
    echo "'$1' fichier invalide"
  fi
}

export KEYTIMEOUT=1
export GTK_IM_MODULE="xim"
