set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins go here:
Plugin 'vim-voom/VOoM'
Plugin 'tyru/open-browser.vim'
Plugin 'bothros/vim-solitaire'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My stuff starts here

set background=light

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set directory=~/tmp//,.,/var/tmp//,/tmp//

" make .md follow highlight as markdown
syntax on
filetype on
au BufNewFile,BufRead *.md set filetype=markdown

" make gx use tyru/open-browser
let g:netrw_nogx=1 " disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
