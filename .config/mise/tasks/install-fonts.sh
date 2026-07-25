#!/usr/bin/env bash
#MISE description="Installs fonts"

if [[ -d ~/.local/share/fonts/GeistMono ]]; then
  echo "GeistMono is already installed"
  exit 0
fi

mkdir -p ~/.local/share/fonts/GeistMono || echo "couldnt create folder"

echo "Installing GeistMono"

curl https://github.com/vercel/geist-font/raw/refs/heads/main/fonts/GeistMono/variable/GeistMono%5Bwght%5D.ttf -o ~/.local/share/fonts/GeistMono/GeistMono[wght].ttf
curl https://github.com/vercel/geist-font/raw/refs/heads/main/fonts/GeistMono/variable/GeistMono-Italic%5Bwght%5D.ttf -o ~/.local/share/fonts/GeistMono/GeistMono-Italic[wght].ttf

echo "Installed GeistMono"
