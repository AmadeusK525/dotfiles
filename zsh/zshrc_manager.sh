time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

echo "Checking for updates."
({cd ~/dotfiles && time_out 4 git fetch -q} &> /dev/null)
 
if [ $({cd ~/dotfiles} &> /dev/null && git rev-list HEAD...origin/master | wc -l) = 0 ]
then
	echo "Already up to date."
else
	echo "Updates Detected:"
	({cd ~/dotfiles} &> /dev/null && git log ..@{u} --pretty=format:%Cred%aN:%Creset\ %s\ %Cgreen%cd)
	echo "Setting up..."
	({cd ~/dotfiles} &> /dev/null && time_out 4 git pull -q && time_out 4 git submodule update --init --recursive)
fi

source ~/dotfiles/zsh/zshrc.sh
