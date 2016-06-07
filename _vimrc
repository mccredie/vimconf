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

" Pathogen is for auto-loading other plugins (by default from the bundle
" directory).
"call pathogen#infect()
"call pathogen#helptags()
call plug#begin('~/vimfiles/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()
" :PlugInstall to install

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'Scripts/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

syntax on
filetype plugin indent on

colorscheme desert

" Basic stuff --------------------------------------------------------------
"

set spell
set backspace=indent,eol,start
set history=50		
set ruler		
set number
set rnu
set showcmd	
set incsearch
set autoindent		
set autowrite
set laststatus=2
set hidden  "ok to have buffers not visible what weren't written
set wrapscan    "search scan wraps around the file
set formatoptions=tcroql
set updatetime=250
" shut the fuck up
set visualbell
set noerrorbells

"backups were so last century. Commit often to git
set nobackup
set noswapfile


" Better Completion
" Where to look for ^N and ^P completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

set fileformat=unix


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

nnoremap ,f :NERDTreeToggle<CR>
vnoremap ,f :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$'] " Ignore pyc files


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
    autocmd bufwritepost _vimrc source ~/_vimrc
augroup END


:nnoremap gF :view <cfile><cr>  : open file under cursor, create if necessary


