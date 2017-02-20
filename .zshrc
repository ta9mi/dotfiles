# exports
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/current/bin:$PATH

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Aeromock
AEROMOCK_HOME=~/.aeromock/applications/current
export PATH=$PATH:$AEROMOCK_HOME

# bind key like Vi
bindkey -v

# for rbenv
eval "$(rbenv init -)"

# for zsh-completions
fpath=(/path/to/homebrew/share/zsh-completions $fpath)
autoload -U compinit
compinit -u

# set prompt
PROMPT='%m:%c %n$ '
