#!/usr/bin/env sh

if ! command -v mise >/dev/null 2>&1; then
  echo "mise is not installed, installing mise..."
  curl https://mise.run | sh
fi

mise bootstrap

# Create an empty config file which will be used when running
# e.g. mise use -g to test stuff out, which should not be accidentally
# committed in the dotfiles.
touch ~/.config/mise/config.toml
