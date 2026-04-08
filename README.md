dotfiles
===

# bootstrap

```sh
cd ~/
git clone git@github.com:foriequal0/dotfiles.git

# NOTE: trailing '/.' is important
cp --recursive --interactive --target-directory ~/ -- \
       dotfiles/bootstrap/.
```
