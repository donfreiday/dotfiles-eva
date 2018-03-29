#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -l'
PS1='[\u@\h \W]\$ '

export VISUAL="nano"

# Currently Metasploit requires running the db_connect command every time msfconsole is started
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
