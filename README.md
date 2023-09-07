# My personal dotfiles

:face_with_head_bandage: - This is me after building my own bike (IDE:rofl:) as nvim

## Contents

- zsh \w [zdharma-continuum/zinit](https://github.com/zdharma-continuum/zinit) package manager. And of course some zsh plugins
- neovim with alots plugins
- .gitconfig
- .ssh/config
- powerlevel10k prompt config

## Requirements

- zsh
- NodeJS (npm for neovim treesitter etc)
- pyenv
- git
- some linux cli tools
  - curl
  - stow

## What else do I use

- [hadolint/hadolint](https://github.com/hadolint/hadolint) - Dockerfile linter
- New generation cli utils eg [junegunn/fzf](https://github.com/junegunn/fzf), [sharkdp/bat](https://github.com/sharkdp/bat) etc 
- check [.zshrc](./.zshrc) to see the full list of plugins in use

## How to

Just clone this repo to home folder, cd and execute `stow .`

For additional info about NodeJS and pyenv check [INSTALL.md](./INSTALL.md)

## TODO

- [ ] zinit async
- [ ] split neovim plugins to different files
- [ ] add some image examples
- [ ] replace null-ls with https://github.com/mhartington/formatter.nvim and https://github.com/mfussenegger/nvim-lint (check also glepnir guard)
