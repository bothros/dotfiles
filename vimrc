" If I'm using fish, vim plugins should use sh
if &shell =~# 'fish$'
    set shell=sh
endif

""""""""""""""""""
" Vundle section "
""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins go here:
Plugin 'vim-voom/VOoM'
Plugin 'tyru/open-browser.vim'
Plugin 'bothros/vim-solitaire'
" Plugin '/home/adams/vim-TODO/.git'
Plugin 'bothros/vim-TODO'
Plugin 'tpope/vim-commentary'
Plugin 'plasticboy/vim-markdown'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'ingydotnet/yaml-vim'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'dag/vim-fish'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""
" My stuff starts here "
""""""""""""""""""""""""

set t_Co=256
colorscheme lucius
LuciusWhite

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Put .swp files in /tmp, rather than in the working directory.
set directory=~/tmp//,.,/var/tmp//,/tmp//

" make .md follow highlight as markdown
syntax on
filetype on
au BufNewFile,BufRead *.md set filetype=markdown

" set default browser for tyru/open-browser
" x-www-browser first for ubuntu, then uzbl-browser for arch
let g:openbrowser_browser_commands = [
\   {'name': 'x-www-browser',
\    'args': ['{browser}', '{uri}']},
\   {'name': 'uzbl-browser',
\    'args': ['{browser}', '{uri}']},
\]

" make gx use tyru/open-browser
let g:netrw_nogx=1 " disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Add // as a json comment prefix
autocmd FileType json set commentstring=//\ %s
