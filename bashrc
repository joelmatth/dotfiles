# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Vi mode
set -o vi

# Environment variables
export EDITOR=vim
export PATH=~/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias spd='wget -O /dev/null '\
'https://download.microsoft.com/download/4/E/C/'\
'4EC66C83-1E15-43FD-B591-63FB7A1A5C04/Windows8.1-KB2919355-x86.msu'

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

# Set ls colours to solarized light
eval $(dircolors $HOME/.dir_colors/dircolors)
