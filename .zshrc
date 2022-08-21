# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setting PATHs
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:${HOME}/Library/Android/sdk/platform-tools
export PATH=$PATH:${HOME}/Library/Android/sdk/build-tools/29.0.0
export PATH=$HOME/bin:$PATH
export PATH="$HOME/.anyenv/bin:$PATH"

# alias
# alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew' 

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# bind key like Vi
bindkey -v

# for tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# anyenv
eval "$(anyenv init -)"

# for git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
