mise activate fish | source
starship init fish | source
brew shellenv | source

# Put brew at the end of the path
fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/bin"
fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/sbin"

fish_add_path -a $ANDROID_HOME/tools
fish_add_path -a $ANDROID_HOME/tools/bin
