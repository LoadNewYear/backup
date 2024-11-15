# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# aliases
alias ls="exa --icons"
#alias cd='z'
#alias vim='nvim'
#alias cat="bat --color always"
alias tmux="tmux -u"
alias clear="echo 'NO!'"
alias vim="nvim"
alias discord="LIBVA_DRIVER_NAME=i915 discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"

# autostart

# evals
#eval "$(zoxide init bash)"
eval "$(starship init bash)"

# Exports
export PATH="$PATH:/home/loadnewyear/.local/bin"
export PATH="$PATH:/home/loadnewyear/.local/share/gem/ruby/3.2.0/bin"
export PATH="$PATH:/home/loadnewyear/go/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
#export PATH=$PATH:/usr/local/go/bin
#. "$HOME/.cargo/env"
#source $HOME/.cargo/env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
