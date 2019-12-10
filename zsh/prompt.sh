# reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

setopt prompt_subst

set_prompt() {

	# [
	PS1="%{$fg[white]%}[%{$reset_color%}"

	# Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
	PS1+="%B%F{45}%}%c%{$reset_color%}"

	# Status Code
	PS1+='%(?.., %{$fg[red]%}%?%{$reset_color%})'

 	# Git
 	if [ -d .git ];then
 		PS1+=', '
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
 		PS1+="%F{208}$BRANCH%{$reset_color%}"
		STATUS=$(git status --short)
		if [ ! -z $STATUS ]; then 
 		  PS1+=', '
 			PS1+="%{$fg[red]%} %{$reset_color%}"
 		fi
 	fi

	# PID
	if [[ $! -ne 0 ]]; then
		PS1+=', '
		PS1+="%{$fg[yellow]%}PID:$!%{$reset_color%}"
	fi

	# Sudo: https://superuser.com/questions/195781/sudo-is-there-a-command-to-check-if-i-have-sudo-and-or-how-much-time-is-left
	CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
	if [ ${CAN_I_RUN_SUDO} -gt 0 ]
	then
		PS1+=', '
		PS1+="%{$fg_bold[red]%} %{$reset_color%}"
	fi

	PS1+="%{$fg[white]%}]: %{$reset_color%}% "
}

precmd_functions+=set_prompt

