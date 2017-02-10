# exports
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# bind key like vi
bindkey -v

# for zsh-completions
fpath=(/path/to/homebrew/share/zsh-completions $fpath)
autoload -U compinit
compinit -u
