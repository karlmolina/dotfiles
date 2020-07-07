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

colorscheme desert

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

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

