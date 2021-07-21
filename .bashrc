parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[1;38;5;197m\]\u \[\033[38;5;83m\]\w\[\033[38;5;220m\]$(parse_git_branch)\[\033[38;5;39m\] \$\[\033[0m\] '

export CLICOLOR=1    
export EDITOR=nvim

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias vim="nvim"    
alias vi="nvim"   

alias gc='git commit -s -v'
alias gb='git branch -v'
alias ga='git add'
alias gb='git branch'
alias gs='git status'
alias gl='git log --oneline'

alias tagit='ctags -f ./tags .'

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias la='ls -al'

alias python='python3'
alias tmux='tmux -2'

shopt -s histappend
HISTCONTROL=ignoreboth
HISTIGNORE='ls:ll:history'
unset HISTFILESIZE
HISTSIZE=100000
HISTTIMEFORMAT="%d/%m/%y %T $ "

PROMPT_COMMAND='history -a; history -n'

alias ll='exa -aBl --group-directories-first -F'
export EXA_COLORS="uw=38;5;148:gw=38;5;148:tw=38;5;148:da=38;5;45"

alias diff='sdiff -s'
