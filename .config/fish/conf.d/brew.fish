if type -fq brew
    brew shellenv | source

    if test -d (brew --prefix)/share/fish/completions
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end
    if test -d (brew --prefix)/share/fish/vendor_completions.d
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

# Add brew paths to PATH regardless of whether brew is installed,
# as Mise could have stuff installed.
if test -d /home/linuxbrew
    # Put brew at the end of the path
    fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/bin"
    fish_add_path -a -P -g --move "/home/linuxbrew/.linuxbrew/sbin"
end
