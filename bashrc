# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Vi mode
set -o vi

# Environment variables
export EDITOR=vim
export PRINTER=Brother_DCP-7055
export PATH=~/bin:~/.cargo/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias spd='wget -O /dev/null '\
'http://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78'\
'-7FB0D4461357/Windows_Win7SP1.7601.17514.101119-1850.AMD64CHK.Symbols.msi'

# Prompt
GIT_PROMPT=/usr/share/git/completion/git-prompt.sh

if [ -f "${GIT_PROMPT}" ]; then
    source "${GIT_PROMPT}"

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    # Explicitly unset color (default anyhow). Use 1 to set it.
    GIT_PS1_SHOWCOLORHINTS=
    GIT_PS1_DESCRIBE_STYLE="branch"
    GIT_PS1_SHOWUPSTREAM="auto git"

    PS1='\n\[\e[0;32m\]\u@\h:\[\e[m\] \[\e[0;33m\]\w$(__git_ps1)\[\e[m\]\n\$ '
else
    PS1='\n\[\e[0;32m\]\u@\h:\[\e[m\] \[\e[0;33m\]\w\[\e[m\]\n\$ '
fi

# Coloured man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
