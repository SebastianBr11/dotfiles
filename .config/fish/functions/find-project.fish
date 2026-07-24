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
