""""""""""""""""""
" NeoBundle section "
""""""""""""""""""

set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins go here:
NeoBundle 'vim-voom/VOoM'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'bothros/vim-solitaire'
" NeoBundle '/home/adams/vim-TODO/.git'
NeoBundle 'bothros/vim-TODO'
NeoBundle 'tpope/vim-commentary'
" NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'PotatoesMaster/i3-vim-syntax'
NeoBundle 'ingydotnet/yaml-vim'
NeoBundle 'wting/rust.vim'
NeoBundle 'cespare/vim-toml'
" NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jnurmine/zenburn'
" NeoBundle 'dag/vim-fish'
NeoBundle 'Matt-Deacalion/vim-systemd-syntax'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'godlygeek/tabular'
NeoBundle 'elzr/vim-json'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired' " Syntastic uses :lnext and :lprev all the time, 
                              " ]l and [l in unimpaired
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'hynek/vim-python-pep8-indent'
" NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build': {'linux': 'make'}}
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'jeetsukumaran/vim-indentwise'

" All of your Plugins must be added before the following line
call neobundle#end()            " required
filetype plugin indent on    " required

NeoBundleCheck

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
" au BufNewFile,BufRead *.md set filetype=markdown

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

" Run pandoc on write, for pandoc-markdown
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#autoexec_command = "Pandoc"

" Add // as a json comment prefix
autocmd FileType json set commentstring=//\ %s

" Make # work right, even with smartindent. From :help smartindent
inoremap # X#

" Set modeline, so you can specify filetyle in comments
set modeline

" Control-J splits a line, doing roughly the opposite of Shift-J.
" This is useful for PEP8.
" TODO: make it delete trailing spaces
nnoremap <C-J> i<CR><Esc>k$

" Open Voom automatically when upon opening a markdown file.
" TOFIX: need to press enter twice for voom to work right. Not sure why.
autocmd FileType pandoc :Voom pandoc

" Unite.vim stuff
function! Unite_ctrlp()
    execute ':Unite  -buffer-name=files -start-insert buffer file_rec/async:'.ProjectRootGuess().'/'
endfunction

nnoremap <space><space> :call Unite_ctrlp()<cr>

function! Unite_grep()
    execute ':Unite grep:'.ProjectRootGuess().'/'
endfunction

nnoremap <space>/ :call Unite_grep()<cr>

let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
