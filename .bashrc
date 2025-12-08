# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if [ -d "$HOME/.cargo" ]; then
    . "$HOME/.cargo/env"
fi

export CHROME_BIN="chromium-browser"

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Use neovim as the default editor.
export EDITOR=nvim
export VISUAL=nvim

# Use neovim as manpager
export MANPAGER='nvim +Man!'

# Mise
eval "$(/home/sebastian/.local/bin/mise activate bash)"

# Aliases
alias nvimc="cd ~/.config/nvim && nvim"

# Drop into fish (taken from https://wiki.archlinux.org/title/Fish#Modify_.bashrc_to_drop_into_fish)
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]; then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
fi
