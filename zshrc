# GENERAL BEHAVIOUR

## use vi key-bindings
bindkey -v

### return to command mode
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M vicmd 'L' end-of-line
bindkey -M vicmd 'H' beginning-of-line

### Search backwards and forwards with a pattern
bindkey -M vicmd 's' history-incremental-pattern-search-backward
bindkey -M vicmd 'S' history-incremental-pattern-search-forward

### set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

## disable software flow control (ctr-s and ctrl-q keybindings free)
stty -ixon

## set rxvt as standard terminal emulator
export TERM=rxvt

## dont save duplicates
setopt HIST_IGNORE_DUPS

# PROMPT
setopt PROMPT_SUBST
autoload -U colors && colors

PCOLOR1=blue
PCOLOR2=red
PCOLOR3=white

PS1="%{$fg[$PCOLOR1]%}(\
%{$fg[$PCOLOR2]%}%n@%m\
%{$fg[$PCOLOR1]%})-(\
%{$fg[$PCOLOR2]%}%~\
%{$fg[$PCOLOR1]%})-(\
%{$fg[$PCOLOR2]%}%*\
%{$fg[$PCOLOR1]%})
%{$fg[$PCOLOR3]%}$ "

# AUTOCOMPLETION
## Load the modules
autoload -U compinit
compinit

## For autocompletion with an arrow-key driven interface:
## zstyle ':completion:*' menu select

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

# HISTORY
HISTFILE=~/.zshhistfile
HISTSIZE=100000
SAVEHIST=100000

# ALIAS
## Normal Aliases
### Always end with ' ' -- aliases can be chained
alias ls='ls --color=auto '
alias l='ls -lh '
alias la='l -A '
alias ..='cd .. '
alias ...='cd ../.. '
alias ll='l | less '
alias lal='la | less '

alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '

alias sag='sudo apt-get '
alias acs='apt-cache search '
alias sagi='sudo apt-get install '

## Global Aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g B="&|"
alias -g HL="--help"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

## Suffix Alias
alias -s txt="vim"
alias -s tex="vim"
alias -s markdown="vim"
alias -s cpp="vim"
alias -s hpp="vim"
alias -s c="vim"
alias -s h="vim"
alias -s hs="vim"
alias -s pdf="evince"
alias -s dvi="evince"
alias -s html="cr"
alias -s mp3="vlc"
alias -s mp4="vlc"
alias -s mpg="vlc"
alias -s avi="vlc"
alias -s flv="vlc"

## custom aliases
alias s="tracker search --limit=10000 "
alias g="git status "
alias gl="git ls-tree --full-tree -r HEAD "

# Functions

## c: shortcut for changing directories
let c() {
	if [ $# -eq 0 ];
	then
	    cd && ls -l;
	else
	    cd "$1" && ls -l;
    fi
}
