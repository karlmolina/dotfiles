git clone git@github.com:karlmolina/dotfiles.git ~/.dotfiles

git --git-dir ~/.dotfiles/.git --work-tree=. reset --hard master

git config --global include.path .customgitconfig

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew install fzf
$(brew --prefix)/opt/fzf/install

brew install pyenv

source ~/.zshrc
