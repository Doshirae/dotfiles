setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{white}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
	' %F{5}[%F{white}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
		[[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
	hook_com[unstaged]+='%F{1}??%f'
fi
}

color_char(){
	if [[ $? -eq 0 ]]; then
		echo "%F{white}%#%{$reset_color%}"
	else
		echo "%F{red}%#%{$reset_color%}"
	fi
}

function preexec() {
	timer=${timer:-$SECONDS}
}

function precmd() {
	vcs_info
	if [ $timer ]; then
		timer_show="$(($SECONDS - $timer))"
		if [[ $timer_show -lt 2 ]]; then
			timer_show=""
		else
			timer_show+="s"
		fi
		unset timer
	fi
}

PROMPT='
%F{blue}%~${vcs_info_msg_0_} %F{yellow}${timer_show}%{$reset_colors%}
$(color_char) '
