# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Startup.
# Check if:
#   1. tmux exists on the system,
#   2. we're in an interactive shell,
#   3. tmux doesn't try to run within itself.
if command -v tmux &> /dev/null \
  && [ -n "$PS1" ] \
  && [[ ! "$TERM" =~ screen ]] \
  && [[ ! "$TERM" =~ tmux ]] \
  && [ -z "$TMUX" ];
then
  tmux attach -t main || tmux new -s main
fi

# Enable ssh authentication agent (for ssh-add).
eval `ssh-agent -s`

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
# Ranger shell prompt indicator.
if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi

# OLD:
#LS_COLORS="rs=0:di=1;33;44:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

#export LS_COLORS

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi

# Should be after ls aliases to apply color instead of default --auto values.
# Uses ANSI Codes: \u001b[34m - 34 at the end stands for blue color.
# Use `dircolors -p` to look up the file codes.
# Some colors rely not only on extension but also on permissions:
#   - bd = (BLOCK, BLK)   Block device (buffered) special file
#   - cd = (CHAR, CHR)    Character device (unbuffered) special file
#   - di = (DIR)  Directory
#   - do = (DOOR) [Door][1]
#   - ex = (EXEC) Executable file (ie. has 'x' set in permissions)
#   - fi = (FILE) Normal file
#   - ln = (SYMLINK, LINK, LNK)   Symbolic link. If you set this to ‘target’ instead of a numerical value,
#       the color is as for the file pointed to.
#   - mi = (MISSING)  Non-existent file pointed to by a symbolic link (visible when you type ls -l)
#   - no = (NORMAL, NORM) Normal (non-filename) text. Global default, although everything should be something
#   - or = (ORPHAN)   Symbolic link pointing to an orphaned non-existent file
#   - ow = (OTHER_WRITABLE)   Directory that is other-writable (o+w) and not sticky
#   - pi = (FIFO, PIPE)   Named pipe (fifo file)
#   - sg = (SETGID)   File that is setgid (g+s)
#   - so = (SOCK) Socket file
#   - st = (STICKY)   Directory with the sticky bit set (+t) and not other-writable
#   - su = (SETUID)   File that is setuid (u+s)
#   - tw = (STICKY_OTHER_WRITABLE)    Directory that is sticky and other-writable (+t,o+w)
#   - *.extension =   Every file using this extension e.g. *.rpm = files with the ending .rpm
# * Attribute codes:
#   - 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
#   - Text color codes:
#   - 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
#   - Background color codes:
#   - 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
LS_COLORS="fi=00;37:ex=01;32:ln=37\
:or=01;30:mi=00:mh=31\
:pi=33:so=43;30:do=35\
:bd=35;01:cd=35\
:su=37;41:sg=30;43:ca=30;41\
:di=01;34:tw=07;34:ow=01;36:st=30;44"

export LS_COLORS

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export NPM_CONFIG_PREFIX=~/.npm-global

WIN_PATH_BACKUP="/mnt/e/soft/ConEmu/ConEmu/Scripts:/mnt/e/soft/ConEmu:/mnt/e/soft/ConEmu/ConEmu:/mnt/c/Users/Александр/AppData/Local/Programs/Python/Python38/Scripts/:/mnt/c/Users/Александр/AppData/Local/Programs/Python/Python38/:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/Program Files (x86)/ffmpeg/bin:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Program Files (x86)/Razer Chroma SDK/bin:/mnt/c/Program Files/Razer Chroma SDK/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/e/TORRENT/Minecraft/WorldPainter:/mnt/e/Lessons/Informatics/Python:/mnt/e/Lessons/Informatics/Python Projects:/mnt/c/ProgramData/chocolatey/bin:/mnt/e/soft/php:/mnt/e/soft/Calibre (Editing Epub files/:/mnt/c/Program Files/MySQL/MySQL Utilities 1.6/:/mnt/c/Program Files/Microsoft/Web Platform Installer/:/mnt/c/Program Files (x86)/Microsoft ASP.NET/ASP.NET Web Pages/v1.0/:/mnt/c/Program Files/Microsoft SQL Server/110/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/120/Tools/Binn/:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/e/soft/Node.js/:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/Microsoft SQL Server/130/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn/:/mnt/c/Program Files (x86)/IncrediBuild:/mnt/e/soft/Graphics Editors/QuickTime/QTSystem/:/mnt/e/soft/Git for Windows/Git/cmd:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files (x86)/Microsoft SQL Server/150/DTS/Binn/:/mnt/c/Program Files/Azure Data Studio/bin:/mnt/c/Program Files (x86)/Microsoft SQL Server/150/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/150/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/150/DTS/Binn/:/mnt/c/Users/Александр/.windows-build-tools/python27/:/mnt/e/soft/JetBrains/JetBrains PyCharm Professional/JetBrains PyCharm Professional 2019.2.4/bin:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/VC/Tools/MSVC/14.25.28610/bin/HostX86/x86:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/Common7/IDE/VC/VCPackages:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/Common7/IDE/CommonExtensions/Microsoft/TestWindow:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/MSBuild/Current/bin/Roslyn:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/Team Tools/Performance Tools:/mnt/c/Program Files (x86)/Microsoft Visual Studio/Shared/Common/VSPerfCollectionTools/vs2019/:/mnt/c/Program Files (x86)/Windows Kits/10/bin/10.0.18362.0/x86:/mnt/c/Program Files (x86)/Windows Kits/10/bin/x86:/mnt/e/soft/Visual Studio Code/VIsual Studio Code 2019/MSBuild/Current/Bin:/mnt/c/Windows/Microsoft.NET/Framework/v4.0.30319:/mnt/e/soft/Visual St:/mnt/c/Users/Александр/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Program Files/Azure Data Studio/bin:/mnt/e/Scripts/Batch/Lessons:/mnt/c/Users/Александр/AppData/Local/atom-nightly/bin:/mnt/c/Users/Александр/.npm-global/bin"
# For clipping and pasting.
WIN_PATH="/mnt/c/ProgramData/WslProgramData";
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/.npm-global/bin:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:/mnt/c/ProgramData/Microsoft/Windows/Start Menu/Programs:/mnt/c/Program Files (x86)/XYplorer:$WIN_PATH";

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export CDPATH=:'~/.bookmarks:/mnt/e';

# Source goto.
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# Trim path up to `n` instances.
PROMPT_DIRTRIM=3

# Windows System Variables.
# # Converted to work with Linux filesystem.
# * Special variables.
export WIN_USER=Александр

# * Paths.
export WIN_HOME=/mnt/c/Users/$WIN_USER
export WIN_LOCALAPPDATA=$WIN_HOME/AppData/Local


# # Not converted to work with Windows filesystem.
# * Paths (APPDATA exists already).
export LOCALAPPDATA="C:\Users\\$WIN_USER\AppData\Local"

# * Some commonly used paths.
WORK=/mnt/e/Work
export WORK

# Default editor.
export EDITOR="nvim"

# Keybindings.
# * Vi mode.
set -o vi

# Exceptions.
wrongParameters=2

# Powerline.
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi
if [ -f /home/dubuntus/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source /home/dubuntus/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
    #source /usr/local/lib/python3.8/dist-packages/powerline/bindings/bash/powerline.sh
fi

# Config.
if [ -f ~./bash/__config ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Utilities.
if [ -f ~/.bash/.bash_utilities ]; then
  . ~/.bash/.bash_utilities
fi

# Taskwarrior project management.
# Declares an array of projects in bash
# The position in the array counts for the id and starts counting at 1
declare -a projects=('Thmoon.OG.P' 'Lessons');

# http://stackoverflow.com/a/16553351
# get length of an array
nrOfProjects=${#projects[@]}
urgencyPrio=4

#echo "Setting up TaskWarrior and TimeWarrior with ${nrOfProjects} projects..."
#echo "DONE = $DONE / URGENT = $URGENT / OVERDUE = $OVERDUE / DUETODAY = $DUETODAY  / DUETOMORROW = $DUETOMORROW"

# Loop will set up task next, task add, task log and timew start for all projects listed above
for (( i = 0; i < $nrOfProjects; i++ ));
do
  #echo "Project $i = ${projects[i]}"
  #alias tn$i="task next project:${projects[i]} +READY"
  #alias tnu$i="tn${i} urgency \> ${urgencyPrio}"
  alias ta$i="task add project:${projects[i]}"
  #alias tl$i="task log project:${projects[i]}"
  #alias twst$i="timew start ${projects[i]}"
done;

# Searching.
# * fzf.
# - Prefer rg over  find.
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

# 
#open_with_fzf() {
    #fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
#}

#cd_with_fzf() {
    #cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
#}

#pacs() {
    #sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
#}
