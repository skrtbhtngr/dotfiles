export CLICOLOR=1    
export EDITOR=nvim

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [[ -f /usr/bin/most || -f /bin/most ]]; then
    PAGER="most"
fi

#History handling
shopt -s histappend
HISTCONTROL=ignoreboth
HISTIGNORE='ls:ll:htop:history:gs:gb:gl'
unset HISTFILESIZE
HISTSIZE=100000
HISTTIMEFORMAT="[%y/%m/%d %T] $ "

# Prompt handling
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -n"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#PS1='${debian_chroot:+($debian_chroot)}\[\033[1;38;5;197m\]\u \[\033[38;5;83m\]\w\[\033[38;5;39m\] \$\[\033[0m\] '
PS1="${debian_chroot:+($debian_chroot)}\[\033[1;38;5;197m\]\u \[\033[38;5;83m\]\w\[\033[38;5;220m\]\$(parse_git_branch)\[\033[38;5;39m\] \$\[\033[0m\] "
PROMPT_DIRTRIM=3

alias vim="nvim"    
alias vi="nvim"   

alias gc='git commit -v'
alias gb='PAGER="less -S" git branch -vv'
alias ga='git add'
alias gs='PAGER="less -S" git status --show-stash'
alias gl='git log --oneline'

alias tagit='ctags -R -f ./tags .'

alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ....='cd .. && cd .. && cd ..'
alias la='ls -Alt'

alias python='python3'
alias tmux='tmux -2'

alias ll='exa -aBl --group-directories-first -F'
EXA_COLORS="uw=38;5;148:gw=38;5;148:tw=38;5;148:da=38;5;45"

alias diff='sdiff -s'
alias time='/usr/bin/time -f "\n$(tput bold && tput setaf 6)%E real, %U user, %S sys, %x exit$(tput sgr0)"'
alias grep='grep --exclude="tags" --exclude="ctags" --exclude="cscope.*" --exclude="*.cmd" --exclude-dir=".git" --color=auto -I'
alias bat='batcat --pager=less'

bind 'set show-all-if-ambiguous on'
