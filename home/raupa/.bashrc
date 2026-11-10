#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Helper Functions

venv_string() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        local parent="${VIRTUAL_ENV%/*}"
        printf " (\e[31mvenv:${parent##*/}\e[0m)"
    fi
}

git_string() {
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        printf " (\e[36mgit:$(basename $(git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null)/$(git branch --show-current 2> /dev/null)\e[0m)"
	fi
}

## Aliases

alias ls='ls --color=auto -A'
alias grep='grep --color=auto'
alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"
alias calc=qalc

## Prompt String

PS1='┌[\[\e[38;5;201m\]\u\[\e[92m\]@\h\[\e[0m\]: \[\e[94m\]\w\[\e[0m\]]$(venv_string)$(git_string)\n└\$ '

## Exports

export PATH="$PATH:/home/raupa/.cargo/bin:/home/raupa/.local/bin"
export LC_TIME="de_DE.UTF-8"
export CC=clang
export CXX=clang++
export GTK_THEME=Sweet
export OPENRAM_HOME="$HOME/eda/tools/OpenRAM/compiler"
export OPENRAM_TECH="$HOME/eda/tools/OpenRAM/technology"
export PDK_ROOT="$HOME/eda/pdks"
export PYTHONPATH="$PYTHONPATH:$OPENRAM_HOME:$OPENRAM_TECH/sky130:$OPENRAM_TECH/sky130/custom"
export VIRTUAL_ENV_DISABLE_PROMPT=1
