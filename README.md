# My dotfiles

Uses a git repository inside of $home with the command.
```
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
```

This changes the working directory to $home. And allows the .git directory to live inside the .dotfiles directory. You could use `git clone --bare` and have the .dotfiles directory to be the .git directory, but then the [master branch isn't set to track the remote](https://git-scm.com/docs/git-clone#git-clone---bare).

See [how to manage your dotfiles with git](https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

## Steps to initialize

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
git --git-dir .dotfiles/.git --work-tree=. reset --hard master
```

4. Add custom git config file to global git config.
```
git config --global include.path .customgitconfig
```

5. Close and reopen bash.

## .extra
The `.extra` file holds information that is only used for the computer it is on. It is not tracked in git. Save $USER variable on this.

## .bash_aliases
`.bash_aliases` contains general aliases and other aliases are divided up to different files. Files such as `.git_aliases.sh` holds aliases for git. The extension `.sh` is added so there is syntax highlighting when editing the file.

## Updating dotfiles
Use the following alias to commit, pull, source .bash_profile, and push all at once.
```
dot
```

# Multiple ssh keys

Create a ssh config file at `~/.ssh/config`. Fix the permissions if needed.

```
chmod 600 ~/.ssh/config
```

Two different ssh keys are created as id_rsa_gitlab and id_rsa_github. I don't actually think you need to start with id_rsa.

```bash
# ~/.ssh/config
Host somegitlab
    Hostname somegitlab
    IdentityFile ~/.ssh/id_rsa_gitlab

Host github.com
    Hostname github.com
    IdentityFile ~/.ssh/id_rsa_github
```
