# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable additional glob operators. (Globbing = pattern matching)
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation
setopt EXTENDED_GLOB

HISTFILE=~/.histfile
SAVEHIST=10000
HISTSIZE=10000

# Use modern file-locking mechanisms, for better safety & performance.
setopt HIST_FCNTL_LOCK

# Keep only the most recent copy of each duplicate entry in history.
setopt HIST_IGNORE_ALL_DUPS

# Don't let > silently overwrite files. To overwrite, use >! instead.
setopt NO_CLOBBER

# Treat comments pasted into the command line as comments, not code.
setopt INTERACTIVE_COMMENTS

# Enable ** and *** as shortcuts for **/* and ***/*, respectively.
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Recursive-Globbing
setopt GLOB_STAR_SHORT

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOBSORT

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# DEFAULTS

zinit ice blockf atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit load Aloxaf/fzf-tab

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/history-search-multi-word

zinit light zsh-users/zsh-autosuggestions

zinit ice from"gh-r" as"program" mv"nvim* -> nvim" pick"nvim/bin/nvim"
zinit light neovim/neovim

zinit ice from"gh-r" as"program" mv"gh* -> gh" pick"gh/bin/gh" \
  atclone"gh/bin/gh completion --shell zsh > _gh" \
  atpull"%atclone"
zinit light cli/cli

# PROMPT

zinit ice depth=1; zinit light romkatv/powerlevel10k

# LINTERS&FORMATTERS

zinit ice from"gh-r" as"program" extract"" pick"stylua"
zinit light JohnnyMorganz/StyLua

zinit ice from"gh-r" as"program" mv"shfmt* -> shfmt" pick"shfmt"
zinit light mvdan/sh

zinit ice from"gh-r" as"program" mv"shellcheck* -> shellcheck" pick"shellcheck/shellcheck"
zinit light koalaman/shellcheck

zinit ice from"gh-r" as"program" mv"hadolint* -> hadolint" pick"hadolint"
zinit light hadolint/hadolint

# CLI TOOLS&OTHERS

zinit light MichaelAquilina/zsh-you-should-use

zinit ice wait lucid id-as
zinit load hlissner/zsh-autopair

zinit snippet OMZP::extract

zinit ice from"gh-r" as"program"
zinit light nektos/act

zinit ice from"gh-r" as"program"
zinit light httpie/httpie

zinit ice from"gh-r" as"program" mv"gruyere* -> gruyere"
zinit light savannahostrowski/gruyere

zinit ice from"gh-r" as"program" pick"zoxide" atload'eval "$(zoxide init zsh)"'
zinit light ajeetdsouza/zoxide

zinit ice from"gh-r" as"program" extract"" pick"difft"
zinit light Wilfred/difftastic

zinit ice from"gh-r" as"program" bpick"*linux*386*" mv"moar* -> moar"
zinit light walles/moar

zinit ice from"gh-r" as"program" mv"delta* -> delta" pick"delta/delta"
zinit light dandavison/delta

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

zinit ice from"gh-r" as"program" extract"" pick"fzf"
zinit light junegunn/fzf

zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" \
  atclone"cp -vf bat/autocomplete/bat.zsh bat/autocomplete/_bat" \
  atpull"%atclone" atload"export MANPAGER='sh -c \"col -bx | bat -l man -p\"'"
zinit light sharkdp/bat

zinit ice from"gh-r" as"program" extract"" pick"bin/exa" \
  atclone"cp -vf completions/exa.zsh completions/_exa" \
  atpull"%atclone"
zinit light ogham/exa

zinit ice from"gh-r" as"program" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

zinit ice from"gh-r" as"program" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# COMPLETIONS
zinit snippet OMZP::docker/completions/_docker

path+=(
  $HOME/.local/bin
)

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias less="less -R"
alias diff="difft --color always | moar"
alias ls="exa --group-directories-first --icons --color-scale"
alias lt="exa --tree --level=2 --icons"
alias ll="ls -alF"
alias gs="git status -sb"
alias gl="git lg"

export EDITOR="nvim"
export VISUAL=$EDITOR

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
