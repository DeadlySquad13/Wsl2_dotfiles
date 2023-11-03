# Directories.
alias ..='cd ..';
alias ...='cd ../../';
alias ....='cd ../../../';
alias .3='cd ../../../';
alias .4='cd ../../../../';
alias .5='cd ../../../../../';

alias .b='cd ./build'
alias .s='cd ./src'

# * Shells
# - Bash.
alias bsh='bash';
# - Powershell.
alias psh='powershell.exe';

# NeoVim.
alias vi='nvim';

# Open (for wsl).
# alias open='cmd.exe /C start';

# Taskwarrior.
alias t='task';

# Goto.
# automatically pushes directory to stack.
alias gp='goto -p';

# Ranger.
alias r='ranger';

# Batch.
alias rn='batchProcess --map '"'"'rename "$1" "$2"'"'"'';

# Lazygit.
alias lg='lazygit';

# Python.
alias py='python3.10';
alias python='python3.10';
#alias pip='pip3';
# * Venv.
alias venv='python -m venv';
# - Install from requirements (not actually venv functionality but highly
#   related (similar to npm i)).
# TODO: checks for running env.
alias venv_i='pip3 install -r requirements.txt';
# TODO: optional venv location.
alias venv_create='python -m venv ./.venv';
# TODO: optional venv location.
alias venv_activate='source ./.venv/bin/activate';
alias venv_deactivate='deactivate';
# TODO: venv_init (create, activate, i), venv_run (create if no .venv, activate)

alias pipi='pip3 install -U';
alias piprm='pip3 uninstall';
# Data science kit.
# TODO: Wrap pip into it's own function.
alias pipi_ds='pipi numpy pandas seaborn matplotlib';
# # Jupyter
# * Jupyter Lab.
# - Start jupyter lab server.
alias julab='jupyter-lab'
alias julab_start='jupyter-lab --no-browser';

# * Jupyter Notebook.
# - Start jupyter notebook server.
alias junote='jupyter notebook --no-browser';

# * Jupyter ascending.
# - Make pair python file for notebook via jupyter ascending.
alias juasc='python -m jupyter_ascending.scripts.make_pair --base';

# * Jupytext.
# @see{@link [jupytextCliDocs]{https://github.com/mwouts/jupytext/blob/main/docs/using-cli.md}}.
# - Alias.
alias jutext='jupytext';
# - Convert existing file to python in preferred cell format.
preferredCellFormat='percent'
alias jutextconvert="jupytext --to py:$preferredCellFormat";


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
# alias wget='curl -O';

# Searching.
#   Search filenames with ripgrep (alternative to find that respects ripgrep ignore
# files, for example, it doesn't search in node_modules).
#   Reference: https://github.com/BurntSushi/ripgrep/issues/193#issuecomment-513201558
alias rgf='rg --files | rg'
rgvi() {
    rg --vimgrep "$1" | nvim -c ':cbuffer'
}
