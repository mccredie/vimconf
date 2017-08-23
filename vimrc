" .vimrc
"
" Author: Matt McCredie <mccredie@gmail.com>
" Credits: Bob Koss gave me his configuration and all of the accompanying
"          tools.  He stole all of his configuration from other people. I've
"          tuned it to suit my needs.
"

" Preamble -------------------------------------------------------------------
"

set nocompatible
filetype off

" Mouse works in terminal

set mouse=a
set ttymouse=xterm2

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'wellle/targets.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'

call plug#end()
" :PlugInstall to install

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

syntax on
filetype plugin indent on

colorscheme desert

" Basic stuff --------------------------------------------------------------
"

set et
set sw=2
set sta
set backspace=indent,eol,start
set history=50
set ruler
set number
"set rnu"
set showcmd
set incsearch
set autoindent
set autowrite
set laststatus=2
set hidden  "ok to have buffers not visible what weren't written
set wrapscan    "search scan wraps around the file
set formatoptions=tcroql
set updatetime=250
"quiet
set visualbell
set noerrorbells

"backups were so last century. Commit often to git
set nobackup
set noswapfile

"use system clipboard for yanking / putting
set clipboard^=unnamed

" Better Completion
" Where to look for ^N and ^P completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview



" When editing a file, always jump to the last known cursor position.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

augroup END


inoremap kj <Esc>
inoremap <Esc> <nop>
vnoremap kj <Esc>
vnoremap <Esc> <nop>


let mapleader=","

nnoremap <leader>, :b#<CR>

nnoremap <leader>f :NERDTreeToggle<CR>
vnoremap <leader>f :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$'] " Ignore pyc files

" Make ctrl-p play nice with nerdtree

" Make ctrl-p play nice with git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_cmd = 'NERDTreeClose\|CtrlP'


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" I like to edit vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Move around splits with <c-hjkl>
"
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" source this file whenever I change it
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

nnoremap gF :view <cfile><cr>  : open file under cursor, create if necessary


" Setup syntastic for javascript / eslint
set statusline+=\ %#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
