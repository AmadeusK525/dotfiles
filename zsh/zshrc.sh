zstyle ':completion:*' menu select

# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=10000
	setopt APPEND_HISTORY
	setopt SHARE_HISTORY
	setopt HIST_EXPIRE_DUPS_FIRST
	setopt EXTENDED_HISTORY

# Aliases
if [ "$(uname -s)" = "Darwin" ]; then
    alias rosetta='arch -x86_64 zsh --login'
fi

alias vim=nvim
alias icat='kitty +kitten icat'

# Custom cd
source ~/dotfiles/zsh/plugins/fixls.zsh

chpwd() ls


autoload -U compinit && compinit

source ~/dotfiles/zsh/plugins/zsh-vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/env-vars.env
source ~/dotfiles/zsh/prompt.sh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
