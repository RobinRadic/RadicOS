# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true


setup_prompt()
{
	local off="\[\e[0m\]"
	local bold="\[\e[1m\]"
	local 	white="\[\e[38;5;15m\]"
	local 	lightgrey="\[\e[38;5;252m\]"
	local 	medgrey="\[\e[38;5;247m\]"
	local 	grey="\[\e[38;5;242m\]"
	local 	verygrey="\[\e[38;5;236m\]"
	local 	black="\[\e[38;5;232m\]"
	local 	green="\[\e[38;5;82m\]"
	local 	yellow="\[\e[38;5;226m\]"
	local 	darkyellow="\[\e[38;5;220m\]"
	local 	orange="\[\e[38;5;202m\]"
	
	local bg_lightgrey="\[\e[48;5;242m\]"
	local bg_medgrey="\[\e[48;5;239m\]"
	local bg_grey="\[\e[48;5;237m\]"
	local bg_verygrey="\[\e[48;5;234m\]"
	local bg_black="\[\e[48;5;232m\]"
	local bg_green="\[\e[48;5;82m\]"
	local bg_yellow="\[\e[48;5;226m\]"
	local bg_darkyellow="\[\e[48;5;220m\]"
	local bg_orange="\[\e[48;5;202m\]"
	
HOSTCOL=`python -W ignore::DeprecationWarning -c "
import commands, md5
colorTuples = zip( [0]*8 + [1]*8, range(30,39)*2 )
hostname = commands.getoutput( 'hostname' )
index = int(   md5.md5(hostname).hexdigest(), 16   ) % len(colorTuples)
hostColor = r'%d;%dm' % colorTuples[index]
print hostColor
"`
HOSTCOL="\[\033[$HOSTCOL\]"
	
	# 100
	export PS1="\
${bg_grey}${orange} \A ${off}\
${bg_verygrey}${grey} \u ${off}\
${HOSTCOL}${bg_grey}${bold} \H ${off}\
${bg_verygrey}${grey} \w ${off}\
\n\
${bg_grey}${darkyellow}${bold} \$ ${off} "

	export PS2="${bg_grey}${darkyellow}${bold} > ${off} "
	
}

setup_prompt