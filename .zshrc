# Setting PATHs
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"
export MONO_GAC_PREFIX="/usr/local"
export PATH=$PATH:/Users/a12087/Library/Android/sdk/platform-tools

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Aeromock
AEROMOCK_HOME=~/.aeromock/applications/current
export PATH=$PATH:$AEROMOCK_HOME

# bind key like Vi
bindkey -v

# for zsh-completions
fpath=(/path/to/homebrew/share/zsh-completions $fpath)
autoload -U compinit
compinit -u

# set prompt
PROMPT='%m:%c %n$ '
