# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -l'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export VISUAL="nano"

# Currently Metasploit requires running the db_connect command every time msfconsole is started
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

#screenfetch

alias gb='code ~/projects/gb'
alias cp="rsync -ah --progress"
alias windows="VBoxManage startvm win10"
alias ubuntu="VBoxManage startvm ubuntu"

alias beersmith='GTK_THEME=Adwaita:light beersmith3'
