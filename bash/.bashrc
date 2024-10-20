# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# aliases
alias ls="exa --icons"
alias cd='z'
alias vim='nvim'
alias cat="bat --color always"
alias tmux="tmux -u"

# autostart

# evals
eval "$(zoxide init bash)"
eval "$(starship init bash)"

# Exports
export PATH="$PATH:/home/loadnewyear/.local/bin"
export PATH="$PATH:/home/loadnewyear/.local/share/gem/ruby/3.2.0/bin"
export PATH="$PATH:/home/loadnewyear/go/bin"
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/go/bin
