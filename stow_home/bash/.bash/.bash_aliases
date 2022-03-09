# Bash.
alias b='bash'

# NeoVim.
alias vi='nvim'

# Open (for wsl).
alias open='cmd.exe /C start'

# Taskwarrior.
alias t='task'

# Goto.
alias g='goto'
# automatically pushes directory to stack.
alias gp='g -p'

# Ranger.
alias r='ranger'

# Batch.
alias rn='batchRename --map '"'"'rename "$1" "$2"'"'"''

# Python.
alias py='python'

# Directory aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dirs='dirs -v'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
