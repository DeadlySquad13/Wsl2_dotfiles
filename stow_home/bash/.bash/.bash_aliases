# Directories.
alias ..='cd ..';
alias ...='cd ../../../';
alias ....='cd ../../../../';
alias .....='cd ../../../../';
alias .4='cd ../../../../';
alias .5='cd ../../../../..';

# * Shells
# - Bash.
alias bsh='bash';
# - Powershell.
alias psh='powershell.exe';

# NeoVim.
alias vi='nvim';

# Open (for wsl).
alias open='cmd.exe /C start';

# Taskwarrior.
alias t='task';

# Goto.
alias g='goto';
# automatically pushes directory to stack.
alias gp='g -p';

# Ranger.
alias r='ranger';

# Batch.
alias rn='batchProcess --map '"'"'rename "$1" "$2"'"'"'';

# Lazygit.
alias lg='lazygit';

# Buku.
alias b='buku --suggest';

# Python.
alias py='python';
alias venv_create='python -m venv ./venv';
alias venv_activate='source ./venv/bin/activate';
alias pipi='pip install -U';
alias piprm='pip uninstall';
# Data science kit.
# TODO: Wrap pip into it's own function.
alias pipi_ds='pipi numpy pandas seaborn matplotlib';
alias jupyter-lab='jupyter-lab --no-browser';

# Directory aliases.
alias ll='ls -alF';
alias la='ls -A';
alias l='ls -CF';
alias dirs='dirs -v';

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"';

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)";
    alias ls='ls --color=auto';
    alias dir='dir --color=auto';
    alias vdir='vdir --color=auto';

    alias grep='grep --color=auto';
    alias fgrep='fgrep --color=auto';
    alias egrep='egrep --color=auto';
fi

# Only the newer Ubuntus get the unified names (datediff, dateadd...).
alias datediff='dateutils.ddiff';
