# Environment

export EDITOR=nvim # Use neovim as the default editor.
export VISUAL=nvim
export MANPAGER='nvim +Man!' # Use neovim as manpager
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

# Aliases

alias nvimc="cd ~/.config/nvim && nvim"
alias git-merged-master='git branch --merged origin/master | grep -Ev "(^\*|^\+|master|main|dev|increment)"'
alias git-merged-main='git branch --merged origin/main | grep -Ev "(^\*|^\+|master|main|dev|increment)"'
alias nvim-pack="NVIM_APPNAME=nvim-vim-pack nvim"
alias nvimc-pack="cd ~/.config/nvim-vim-pack && nvim-pack"
alias nv="nvim-pack"
alias nvc="nvimc-pack"
alias nvd="cd ~/.dotfiles && nv"
