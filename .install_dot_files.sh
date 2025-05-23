git clone git@github.com:karlmolina/dotfiles.git ~/.dotfiles
git --git-dir ~/.dotfiles/.git --work-tree=. reset --hard master
git config --global include.path .customgitconfig
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install pyenv
brew install bat
source ~/.zshrc
curl -s "https://get.sdkman.io" | zsh
brew install the_silver_searcher
brew install ripgrep
brew install diff-so-fancy
brew install starship
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install go from website
# brew install go
# Node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install node # install latest version of node
# You shouldn't ever lose your work if you're using Git 
brew install dura
brew install neovim
brew install jesseduffield/lazygit/lazygit
brew install go-task/tap/go-task
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
