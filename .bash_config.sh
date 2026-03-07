eval "$(mise activate bash)"

BREW_BIN_PATH=/home/linuxbrew/.linuxbrew/bin
BREW_SBIN_PATH=/home/linuxbrew/.linuxbrew/sbin

# On e.g. Bazzite running this twice would add the path twice and moving it to the end wouldn't work anymore
if [[ ":$PATH:" != *":${BREW_BIN_PATH}:"* ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Put brew at the end of the path
export PATH=$(echo "$PATH" | sed -e "s|:${BREW_BIN_PATH}||g"):$BREW_BIN_PATH
export PATH=$(echo "$PATH" | sed -e "s|:${BREW_SBIN_PATH}||g"):$BREW_SBIN_PATH

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
