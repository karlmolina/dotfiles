# dotfiles
My dotfiles

Uses a git repository inside of $home with the command.
```
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
```

This changes the working directory to $home. And allows the .git directory to live inside the .dotfiles directory. You could use `git clone --bare` and have the .dotfiles directory to be the .git directory, but then the [master branch isn't set to track the remote](https://git-scm.com/docs/git-clone#git-clone---bare).

See [How to manage your dotfiles with git](https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

# Steps to initialize

1. Go to the home directory.
```
cd
```

2. Clone the repo to the .dotfiles directory.
```
git clone git@github.com:karlmolina/dotfiles.git .dotfiles
```

3. Reset your current files to the master branch. (Note: this will remove current changes so don't do this if you don't want that)
```
git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME reset --hard master
```

# Updating dotfiles
Use the following alias to commit, pull, source .bash_profile, and push all at once.
```
dot
```
