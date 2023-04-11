#!/bin/zsh

export TERM="xterm-256color"
export HISTSIZE=500
export SAVEHIST=0

####### catch non-zsh and non-interactive shells ######
[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

for f in "$ZDOTDIR"/{settings,plugins}/*.zsh; do
   source "$f" 2>/dev/null
done
unset f

# use cache history location when we are root
[[ $(whoami) == 'root' ]] && HISTFILE=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.cache/zsh_history

autoload -Uz comptinit promptinit
promptinit
compinit -d ~/.cache/zcompdump-$ZSH_VERSION

####### reduce system calls for timezone ########
typeset -gx TZ=:/etc/localtime

##### strip empty fields from the path ####
path=("${path[@]:#}")

# Source prompt settings
#source "$ZDOTDIR"/themes/agnoster.zsh-theme.zsh
#source "$ZDOTDIR"/themes/zsh-theme.zsh
#source "$ZDOTDIR"/themes/funcky-zsh-theme.zsh
source /usr/lib/python3.10/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use beam shape cursor for each new prompt.
precmd() { echo -ne '\e[5 q' ;}

PROMPT_USERFMT='%n%f@%F{red}%m'
