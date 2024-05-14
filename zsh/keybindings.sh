# Bash-like ^k and ^y
bindkey "^k" kill-line
bindkey "^y" vi-put-before

# up
function up_widget() {
	BUFFER="cd .."
	zle accept-line
}
zle -N up_widget
bindkey "^u" up_widget

# Clear
function ctrl_l() {
    BUFFER="clear"
    zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Home - Navigates to the current root workspace
function git_root() {
	BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
	zle accept-line
}
zle -N git_root
bindkey "^h" git_root
