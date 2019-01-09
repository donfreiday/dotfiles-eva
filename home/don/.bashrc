# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Default text editor
export VISUAL="nano"

# Currently Metasploit requires running the db_connect command every time msfconsole is started
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

# Permanent aliases
alias ls='ls --color=auto -l'
alias windows="VBoxManage startvm win10"
alias ubuntu="VBoxManage startvm ubuntu"
alias beersmith='GTK_THEME=Adwaita:light beersmith3'

# Temporary aliases
alias gb='code ~/projects/gb'

# Wine font fix
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"

##############################################################################################################
# Nvidia driver tweaks
# Allow the NVidia driver to work multi threaded. This speeds up when the drivers has a lot to do, but when your
# CPU is filled to the max, it can lower fps. It is standard on when the driver thinks it can improve
# performance. You can set it to 1 to force it on, or 0 to turn it off.
export __GL_THREADED_OPTIMIZATION=1

# Shaders have to be created on the fly on Linux, this gives stuttering. These shaders are stored in a cache.
# NVidia cache has a maximum of 128mb shared across all games if you do not set anything. It is better to use a
# cache per game. Use __GL_SHADER_DISK_CACHE= 0 or 1 to disable / enable, and
# __GL_SHADER_DISK_CACHE_PATH=/path/to/location to set the location.
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH=/home/don/.shader-cache

# Unlocks the limit of 128mb shader cache size. The game will use as much cache as it needs. Use
# __GL_SHADER_DISK_CACHE_SKIP_CLEANUP= 0 or 1 to disable / enable.
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

# Nvidia driver, prefer max performance
# sleep 1 && DISPLAY=":0.0" nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1 &>/dev/null

# End nvidia tweaks
##############################################################################################################

# Backup personal wiki in case TW eats it again
cp ~/Dropbox/apps/TW5\ in\ the\ Sky\ \(Arlen22\)/don.html ~/Dropbox/apps/wiki-backup/`date -u +"%Y-%m-%d"`.html
