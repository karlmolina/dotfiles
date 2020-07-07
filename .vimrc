" Install plug.vim plugin manager if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on

" Syntax highlighting baby
syntax on

" Escape with jk
imap jk <Esc>
tnoremap jk <C-\><C-n>

" Backspace is broken
set bs=2

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Add line numbers
set number

" 4 character tab
set tabstop=4

" Use spaces instead of tabs
set expandtab

" >> will shift over 4 spaces
set shiftwidth=4

set smartindent

set fileformat=unix

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" Incremental search
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme gruvbox
set background=dark
