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

if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Existing Vundle directory found at $HOME/.vim/bundle/Vundle.vim"
else
    echo "No Vundle directory found, cloning to $HOME/.vim/bundle/Vundle.vim"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "...done"
fi

echo
echo "Finished."
echo "You'll probably need to open up vim and run ':PluginInstall'"
echo
