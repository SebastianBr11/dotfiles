#!/usr/bin/env sh

if ! command -v mise >/dev/null 2>&1; then
  echo "mise is not installed, installing mise..."
  curl https://mise.run | sh
fi

mise bootstrap
