mise activate fish | source
starship init fish | source
brew shellenv | source

if test -d (brew --prefix)/share/fish/completions
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end
if test -d (brew --prefix)/share/fish/vendor_completions.d
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Put brew at the end of the path
fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/bin"
fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/sbin"

fish_add_path -a $ANDROID_HOME/tools
fish_add_path -a $ANDROID_HOME/tools/bin

function find-project
    set -l location (~/bin/choose-project)
    if test -n "$location"
        cd "$location"
        if count $argv >/dev/null
            nv
        end
    end
end

abbr --add fp find-project
abbr --add fpn find-project 1
