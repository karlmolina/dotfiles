# dotfiles
My dotfiles

Uses a git repository inside of $home with the command.
```
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
```

This changes the working directory to $home.

See [How to manage your dotfiles with git](https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

# Steps to initialize
```
cd
```

```
git clone git@github.com:karlmolina/dotfiles.git .dotfiles
```

```
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
```

```
df reset --hard master
```

# Updating dotfiles
```
dot
```
