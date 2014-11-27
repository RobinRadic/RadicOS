# Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile || true

# Most applications support several languages for their output.
# To make use of this feature, simply uncomment one of the lines below or
# add your own one (see /usr/share/locale/locale.alias for more codes)
# This overwrites the system default set in /etc/sysconfig/language
# in the variable RC_LANG.
#
#export LANG=de_DE.UTF-8	# uncomment this line for German output
#export LANG=fr_FR.UTF-8	# uncomment this line for French output
#export LANG=es_ES.UTF-8	# uncomment this line for Spanish output


# Some people don't like fortune. If you uncomment the following lines,
# you will have a fortune each time you log in ;-)

#if [ -x /usr/bin/fortune ] ; then
#    echo
#    /usr/bin/fortune
#    echo
#fi


setup_profile_prompt() {
	local off="\[\e[0m\]"
	local bold="\[\e[1m\]"
	local yellow="\[\e[93m]"
	local black="\[\e[30m\]"
	local red="\[\e[31m\]"
	local green="\[\e[32m\]"
	local white="\[\e[37m\]"
	local light_yellow="\[\e[33m\]"
	
	local bg_black="\[\e[40m\]"
	local bg_red="\[\e[41m\]"
	local bg_green="\[\e[42m\]"
	local bg_yellow="\[\e[43m\]"
	local bg_grey="\[\e[47m\]"
	local bg_lightblue="\[\e[44m\]"
	
	# \u  \H \w
	export PS1="${off}${bg_grey}${red} \A \
${off}${green}${bg_lightblue} \u \
${off}${bg_grey}${red} \H \
${off}${bg_black}${green} \w ${bg_black}\
\n\
${bg_black}${red}${bold} \$ ${bg_black} ${white}"
}
setup_profile_prompt

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
} 
export PATH="/radicos/bin:/home/radic/bin:$PATH"