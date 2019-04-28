# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Default text editor
export VISUAL="vim"

# Currently Metasploit requires running the db_connect command every time msfconsole is started
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

# Wine font fix
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"


# Backup personal wiki in case TW eats it again
cp ~/Dropbox/wiki.html ~/Dropbox/docs/wiki-backup/`date -u +"%Y-%m-%d"`.html

# Python Virtual Environments
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Increase bash history size
export HISTFILESIZE=20000
shopt -s histappend