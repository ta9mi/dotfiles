# Setting PATHs
export PATH=/usr/local/bin:$PATH

# set prompt
PROMPT='%m:%c %n$ '

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# bind key like Vi
bindkey -v

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -u

# for anyenv
if [ -f ~/.anyenv/bin/anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  alias brew="env PATH=${PATH/\/Users\/${USER}\/.anyenv\/envs\/*env\/shims:/} brew"
fi
