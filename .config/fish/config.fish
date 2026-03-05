if status is-interactive
    # Commands to run in interactive sessions can go here
end
mise activate fish | source
starship init fish | source

# Homebrew Setup from https://github.com/orgs/Homebrew/discussions/4412
brew shellenv | source

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER "nvim +Man!"
set -gx CHROME_BIN chromium-browser
