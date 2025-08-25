export LANG=ja_JP.UTF-8

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Initialize
source ~/.git-completion.bash
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(gh completion -s bash)" # gh-cli
eval "$(gibo completion bash)"
