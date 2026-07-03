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
    set picked (~/bin/find-project | fzf --ansi --layout=reverse --height=50% --preview='
        proj=$(printf "%s" "{}" | awk "{print \$1}" | tr -d "'\''")
        tag=$(printf "%s" "{}" | awk "{print \$3}" | sed "s/[()]//g" | tr -d "'\''")
        dir="$HOME/dev/$tag/$proj"

        if command -v eza >/dev/null 2>&1; then
            eza "$dir" --icons=always -1 --group-directories-first --color=always | head -n 200
        else
            ls -R -1 2>&1 | head -n 200
        fi
    ' | awk '{gsub(/[()]/,"",$3); $3=$3"/"; print $3$1; exit}')
    echo "picked '$picked'"
    if test -n "$picked"
        cd "$HOME/dev/$picked"
    end
end

abbr --add fp find-project
