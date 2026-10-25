function __android_complete
    set -l tokens (commandline -opc)
    set -e tokens[1]

    android --complete $tokens 2>/dev/null | string split -n ' '
end

complete -c android -f -a '(__android_complete)'
