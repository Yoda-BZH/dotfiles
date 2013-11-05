#!/bin/bash

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias gerp="grep"
alias cgrep='grep --color=always --exclude=\*.svn\*'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias cegrep='egrep --color=always'
alias egrep='egrep --color=auto'

alias sls='screen -ls'
alias nsc='screen -dmS'
alias scw='screen -wipe'
alias scr="screen -r"
## todo: add tmux aliases
alias halt="echo 'Cannot halt. Use /sbin/halt'"
alias reboot="echo 'Cannot reboot. Use /sbin/reboot'"
alias lns="ln -s"
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias sudo="sudo -E" ## does not work on lenny
alias please="sudo"
alias gaeny="geany"
alias sys_create_dirs="mkdir -p bin etc lib usr/{src,share} var/{www,run,lib,log} tmp"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## blue
	export PS1='\[\033[1;34m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;34m\]@\[\033[1;37m\]\h\[\033[1;34m\])(\[\033[1;37m\]\t\[\033[1;34m\])\n\[\033[1;34m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;34m\])\[\033[1;37m\]->\[\033[0m\] '

## red
	#PS1='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '

## light blue
  PS1='\[\033[1;36m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;36m\]@\[\033[1;37m\]\h\[\033[1;36m\])(\[\033[1;37m\]\t\[\033[1;36m\])\n\[\033[1;36m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;36m\])\[\033[1;37m\]->\[\033[0m\] '

## FIXME
	## alias au cas où
	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'

	if [ `id -u` -eq 0 ]
	then
		## root
		PS1='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '
	fi

	if [[ $HOSTNAME = *prod* ]]
	then
	  ## red
		PS1='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '
	fi


if [ -d "$HOME/bin" ]
then
	export PATH=$PATH:$HOME/bin
fi

