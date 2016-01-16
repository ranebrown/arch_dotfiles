#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias clc='clear'

alias server='ssh brownsr@eces-shell.colorado.edu'

# PS1 sets prompt
# \u = username, \h = hostname,  \w = full working directory, 
# \t = current time hh:mm:ss, \@ = current time am/pm, \d = date
# \! = history number of last command, \$? = status of last command 
# \e[ = start of foreground (text) color, x;ym = color code i.e. 0;34, \e[m = end of color
# \e[m = start background color, can combine a background and text color at beginning -> only need one \e[m at end
# \[ = begin sequence of non-printing characters, \] = end sequence of non-printing characters
# \[ \] should be used around color codes so prompt appears in correct place
#export PS1="\[\e[36m\][\w]\[\e[m\]\n\[\e[1;31m\]>> \[\e[m\]"
export PS1="\[\e[36m\][\w]\[\e[m\]\n\[\e[33m\]\!:\[\e[m\]\[\e[m\]cmd(\[\e[m\]\$(if [[ \$? == 0 ]]; then echo \[\e[32m\]\"\342\234\223\"\[\e[m\]; else echo \[\e[31m\]\"\342\234\227\"\[\e[m\]; fi)\[\e[m\])\[\e[m\]\[\e[m\] \[\e[1;31m\]>>\[\e[m\]"


alias pyxis='cd /home/rane/Documents/ClassesSprg16/IndependentStudy/pyxis'

alias .='cd ..'
alias ..='cd ../..' 
alias ...='cd ../../..' 
alias ....='cd ../../../..' 

export MATLAB_JAVA=/usr/lib/jvm/java-8-openjdk/jre/

alias matlabgui='matlab -desktop -nosplash'
alias matlab='matlab -nodesktop -nosplash'

# Set titlebar
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;URxvt: ${USER}@${HOSTNAME}\007"'
	# Show the currently running command in the terminal title:
	# http://www.davidpashley.com/articles/xterm-titles-with-bash.html
	show_command_in_title_bar()
	{
		case "$BASH_COMMAND" in
			*\033]0*)
				# The command is trying to set the title bar as well;
				# this is most likely the execution of $PROMPT_COMMAND.
				# In any case nested escapes confuse the terminal, so don't
				# output them.
				;;
			*)
				echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
				;;
		esac
	}
	trap show_command_in_title_bar DEBUG
	;;
*)
	;;
esac

# solarized colors for ls command
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`
