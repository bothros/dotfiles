set nocompatible                 " choose no compatibility with legacy vim
syntax enable
set encoding=utf-8
set showcmd                      " display incomplete commands
filetype plugin indent on        " load file type plugins + indentation

"" Whitespace
set nowrap                       " don't wrap lines
set tabstop=4 shiftwidth=4       " a tab is four spaces
set expandtab                   " use spaces not tabs
set backspace=indent,eol,start   " backspace through everything in insert mode

"" Searching
set hlsearch                     " highlight matches
set incsearch                    " incremental searching
set ignorecase                   " searches are case insensitive...
set smartcase                    " ... unless they contain at least one capital letter

"" Plugins
call pathogen#infect()           " start up pathogen
call pathogen#helptags()         " ditto

"" Solarized
let g:solarized_termcolors=16
let g:solarized_termtrans=1      " fixes background in terminal
set background=dark
colorscheme solarized

"" indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8
