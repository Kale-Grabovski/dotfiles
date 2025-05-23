# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {

	# [
	#PS1="["

	# Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
	#PS1+="%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}"

 	# Git
 	#if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
 #		PS1+=', '
 #		PS1+="%{$fg[magenta]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
#		STATUS=$(git status --short | wc -l)
#		if [ $STATUS -gt 0 ]; then 
# 			PS1+="%{$fg[green]%}+$(echo $STATUS | awk '{$1=$1};1')%{$reset_color%}"
# 		fi
# 	fi

	# ]
	#PS1+="]: "
}

precmd_functions+=set_prompt

preexec () {
   (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
   _start=$SECONDS
}

precmd () {
   (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   _start=-1 
}
