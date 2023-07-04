# How to put all this together

## Linux

Works and tested on Ubuntu 22.04

### How to

1. Install packages via apt

```
sudo apt update && sudo apt install zsh \
    snapd cargo git aptitude \
    stow sqlite3 unzip curl 
```

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
cd $HOME/.dotfiles && stow .
```

5. Make zsh default. Restart terminal session after that

```
chsh -s $(which zsh)
```

6. Install the required version of python and assign it to the global

```
pyenv install 3.11
pyenv global 3.11
```

7. Install neovim node/python dependencies, null-ls diagnostics/formatters etc

```
# Python formatters, linters. Neovim python dependency and codespell
pip install ruff black isort add-trailing-comma pynvim codespell

# JS, TS, Markdown etc formatter \w daemon. Neovim node dependency and cspell
sudo npm install -g prettier @fsouza/prettierd neovim cspell@latest \
    @cspell/dict-ru_ru @cspell/dict-shell
```

8. Change path to python intrpetator in neovim [config](https://github.com/serginhohigh/dotfiles/blob/6d58bc0523d791b348606053b488aa2241d2ad7a/.config/nvim/init.lua#L4)

## Windows

### Tools

- [ScoopInstaller/Scoop](https://github.com/ScoopInstaller/Scoop)
- Docker with wsl engine. Check official install documentation at https://docs.docker.com/desktop/wsl/

### How to

1. Install scoop. Can read how install here https://github.com/ScoopInstaller/Scoop#installation

2. Install win32yank for neovim copy/paste compatibility

```
scoop install win32yank
```

3. Download and install docker desktop with wsl engine.
   > Use custom installation. Why? Read this [issue](https://github.com/docker/for-win/issues/13318)
   >
   > Don't forgot change ur disk letter!
   >
   > Also check this [issue](https://github.com/microsoft/WSL/issues/8725)

```
Start-Process "Docker Desktop Installer.exe" -Verb RunAs -Wait -ArgumentList "install --installation-dir=E:\Docker\"
```
