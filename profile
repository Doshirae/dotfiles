#
# ~/.profile
#
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s` > /dev/null
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

