if type -fq brew
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
end
