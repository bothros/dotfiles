# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
set fish_theme bobthefish

set -g theme_display_ruby no
set -g theme_display_user yes

# Highlighting colors
set -U fish_color_command    00875f
set -U fish_color_error      d70000
set -U fish_color_match      00d7af
set -U fish_color_operator   00d7af
set -U fish_color_param      00d7af
set -U fish_color_quote      878700
set -U fish_color_valid_path 00d7af\x1e\x2d\x2dunderline

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
