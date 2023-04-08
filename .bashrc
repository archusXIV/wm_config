#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
export MANWIDTH="100"
export HISTSIZE="10000"
export HISTIGNORE="q:f:v"
export TERM="xterm-256color"
export HISTCONTROL="ignoreboth:erasedups"

HISTFILE="$HOME/.config/bash/bash_history"

# ensure ~/.local/bin is on the path
[[ $PATH =~ '~/.local/bin' ]] || PATH=~/.local/bin:$PATH
SCRIPTDIR="$HOME/.local/bin"
path+=("$SCRIPTDIR" "${SCRIPTDIR}"/*/)
export PATH

# source shell aliases & functions
source ~/.config/bash/bash_aliases
source ~/.config/bash/bash_funcs

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify

[[ -n $DISPLAY ]] && shopt -s checkwinsize

function gitPrompt {
  command -v __git_ps1 > /dev/null && __git_ps1 " (%s)"
}

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtcyn}"
nameC="${bldblu}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtred}"
normalC="${txtcyn}"

# Red name for root
if [ "${UID}" -eq "0" ]; then
  nameC="${txtred}"
fi

# Patent Pending Prompt
#export PS1="${pathC}\w${gitC}\$(gitPrompt)${pointerC} ▶${txtrst} "

# prompt if file sourcing below fails
#PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

PS1="\n \D{%F} \t ${nameC}\u${atC}@${hostC}\h:${pathC}\w${gitC}\$(gitPrompt)
========================================
${pointerC} ▶${txtrst} "

