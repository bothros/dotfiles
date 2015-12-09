#!/bin/sh

dir=~/dotfiles
olddir=~/dotfiles_old
files="dir_colors vimrc"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

if [ -d "$HOME/.vim/bundle/neobundle.vim" ]; then
    echo "Existing NeoBundle directory found at $HOME/.vim/bundle/neobundle.vim"
else
    echo "No NeoBundle directory found, cloning to $HOME/.vim/bundle/neobundle.vim"
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    echo "...done"
fi

echo
echo "Finished."
echo
echo "If you want Syntastic to do you any good, you'll need to install some"
echo "checkers for it. I use flake8, for python."
echo
