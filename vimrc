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
" Plugin 'plasticboy/vim-markdown'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'ingydotnet/yaml-vim'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'
" Plugin 'jonathanfilip/vim-lucius'
Plugin 'jnurmine/zenburn'
" Plugin 'dag/vim-fish'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'vim-perl/vim-perl'
Plugin 'godlygeek/tabular'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""
" My stuff starts here "
""""""""""""""""""""""""

set t_Co=256
colorscheme zenburn
"colorscheme lucius
"LuciusLight

set pastetoggle=<F10>

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
" x-www-browser first for gnome, then chromium.
let g:openbrowser_browser_commands = [
\   {'name': 'x-www-browser',
\    'args': ['{browser}', '{uri}']},
\   {'name': 'chromium',
\    'args': ['{browser}', '{uri}']},
\   {'name': 'w3m',
\    'args': ['{browser}', '{uri}']},
\]

" make gx use tyru/open-browser
let g:netrw_nogx=1 " disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Recommended syntastic settings
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Add // as a json comment prefix
autocmd FileType json set commentstring=//\ %s

" Open Voom automatically when upon opening a markdown file.
" TOFIX: need to press enter twice for voom to work right. Not sure why.
autocmd FileType markdown :Voom pandoc
