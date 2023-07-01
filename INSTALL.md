# How to put all this together

## Linux

Works and tested on Ubuntu 22.04

### How to

1. Install packages via apt

```
sudo apt update && sudo apt install zsh \
    snapd cargo git aptitude \
    zsh stow fzf exa bat \
    sqlite3 unzip ripgrep fd-find
```

> ! Dont forget the symlobic link for bat - https://github.com/sharkdp/bat#on-ubuntu-using-apt
>
> Download [hadolint](https://github.com/hadolint/hadolint), [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) from releases manually. Dont forget make them exutable!
>
> Recommend create $HOME/.bin folder for executable utils as bat, hadolint, diff-so-fancy etc

2. Install NodeJS, pyenv

- pyenv
  > https://github.com/pyenv/pyenv#automatic-installer
  >
  > https://github.com/pyenv/pyenv/wiki#suggested-build-environment
- NodeJS
  > https://github.com/nodesource/distributions#installation-instructions

3. Clone this repo into home folder

```
git clone https://github.com/serginhohigh/dotfiles $HOME/.dotfiles
```

4. Link dotfiles to ur home directory

```
cd $HOME/.dotfiles && stow --ignore='\.md' .
```

5. Make zsh default. Restart terminal session after that

```
chsh -s $(which zsh)
```

6. Install neovim via snap

```
snap install nvim --classic
```

> If you encounter problems, see the official instructions - https://github.com/neovim/neovim/wiki/Installing-Neovim

7. Install the required version of python and assign it to the global

```
pyenv install 3.11
pyenv global 3.11
```

8. Install neovim node/python dependencies, null-ls diagnostics/formatters etc

```
# Python formatters, linters. Neovim python dependency
pip install ruff black isort add-trailing-comma pynvim

# JS, TS, Markdown etc formatter \w daemon. Neovim node dependency
sudo npm install -g prettier @fsouza/prettierd neovim

# Lua code formatter for neovim
cargo install stylua
```

9. Change path to python intrpetator in neovim [config](https://github.com/serginhohigh/dotfiles/blob/6d58bc0523d791b348606053b488aa2241d2ad7a/.config/nvim/init.lua#L4)

## Windows

### Tools

- [ScoopInstaller/Scoop](https://github.com/ScoopInstaller/Scoop)
- Docker with wsl engine. Check official install documentation at https://docs.docker.com/desktop/wsl/

### How to

1. Install scoop. Can read how install here https://github.com/ScoopInstaller/Scoop#installation

2. Install win32yank for neovim copy/paste compability

```
scoop install win32yank
```

3. Download and install docker desktop with wsl engine.
   > Use custom installation. Why? Read this [issue](https://github.com/docker/for-win/issues/13318)
   >
   > Dont forgot change ur disk letter!

```
Start-Process "Docker Desktop Installer.exe" -Verb RunAs -Wait -ArgumentList "install --installation-dir=E:\Docker\"
```
