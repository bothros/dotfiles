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

fishpath="$(command -v fish)"

if [ -z "$fishpath" ]; then
    echo "Fish not installed. Run again once you install fish, if you want fish config."
else
    if [ -d "$HOME/.oh-my-fish" ]; then
        echo "Existing oh-my-fish directory found at $HOME/.oh-my-fish"
    else
        echo "No oh-my-fish directory found, installing oh-my-fish"
        curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
        echo "...done"
    fi

    echo "Creating symlink to config.fish in $HOME/.config/fish/"
    mv ~/.config/fish/config.fish $olddir
    if [ "$1" = "notheme" ]; then
        ln -s $dir/config.fish.notheme ~/.config/fish/config.fish
    else
        ln -s $dir/config.fish ~/.config/fish/config.fish
    fi
    echo "...done"

    echo "Creating symlink to ls.fish in $HOME/.config/fish/functions"
    mkdir -p ~/.config/fish/functions/
    mv ~/.config/fish/functions/ls.fish $olddir
    ln -s $dir/ls.fish ~/.config/fish/functions/ls.fish
    echo "...done"
fi

echo
echo "Finished."
echo "You'll probably need to open up vim and run ':PluginInstall'"
echo
