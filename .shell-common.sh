# Environment

export EDITOR=nvim # Use neovim as the default editor.
export VISUAL=nvim
export MANPAGER='nvim +Man!' # Use neovim as manpager
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

# Aliases

alias git-merged-master='git branch --merged origin/master | grep -Ev "(^\*|^\+|master|main|dev|increment)"'
alias git-merged-main='git branch --merged origin/main | grep -Ev "(^\*|^\+|master|main|dev|increment)"'
alias nvim-plus="NVIM_APPNAME=nvim-plus nvim"
alias nvimc-plus="cd ~/.config/nvim-plus && nvim-plus"
alias nv="nvim"
alias nvc="nvimc"
alias nvimc="cd ~/.config/nvim && nvim"
alias nvd="cd ~/.dotfiles && nv"
