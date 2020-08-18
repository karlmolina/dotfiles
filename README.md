# My dotfiles

Uses a git repository inside of $home with the command.
```
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
```

This changes the working directory to $home. And allows the .git directory to live inside the .dotfiles directory. You could use `git clone --bare` and have the .dotfiles directory to be the .git directory, but then the [master branch isn't set to track the remote](https://git-scm.com/docs/git-clone#git-clone---bare).

See [how to manage your dotfiles with git](https://medium.hackinrio.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

## Install

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## .extra
The `.extra` file holds information that is only used for the computer it is on. It is not tracked in git. Save $USER variable on this.
```sh
# ~/.extra.sh
USER=/Users/karl
```

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
