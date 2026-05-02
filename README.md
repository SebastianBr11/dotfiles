# Dotfiles

## Getting Started

Get Brew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Get yadm

```shell
brew install yadm
```

Get the dotfiles

```shell
yadm clone git@github.com:SebastianBr11/dotfiles.git
```

## Setup commit signing

Add the path to the signingkey to `~/.gitconfig`: (it will automatically be used
for projects in `~/dev/`)

```gitconfig
[user]
        signingkey = ~/.ssh/key.pub
```

## Common Firefox Extensions

- Bitwarden: <https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/>
- Dark Reader: <https://addons.mozilla.org/en-US/firefox/addon/darkreader/>
- KeepassXC Browser: <https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser>
- Linkding: <https://addons.mozilla.org/en-US/firefox/addon/linkding-extension>
- Linkding Injector: <https://addons.mozilla.org/en-US/firefox/addon/linkding-injector>
- Obsidian Web Clipper: <https://addons.mozilla.org/en-US/firefox/addon/web-clipper-obsidian>
- Readeck: <https://addons.mozilla.org/en-US/firefox/addon/readeck/>
- uBlock Origin: <https://addons.mozilla.org/en-US/firefox/addon/ublock-origin>
  - Filterlists: <https://github.com/yokoffing/filterlists>
- Vimium: <https://addons.mozilla.org/en-US/firefox/addon/vimium-ff>
- Yomitan: <https://addons.mozilla.org/en-GB/firefox/addon/yomitan/>
- Zotero Connector: <https://www.zotero.org/download/>
