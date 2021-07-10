" Install plug.vim plugin manager if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Give more space for displaying messages.
set cmdheight=2

syntax on
" jk to escape
imap jk <Esc>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" more powerful backspacing
set backspace=indent,eol,start  
" Hide modified files into buffers
set hidden
" Do I want these?
" set autoread
" set autowrite
" Line numbers
set number
" Good indents
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set fileformat=unix
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" Ignore case when searching unless search contains uppercase
set ignorecase
set smartcase
" Of course I want to be able to use a mouse!
set mouse=a
" Copy to system clipboard with yank
set clipboard=unnamed
" Color the 80 column light grey
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" vim-plug plugin manager
" see mappings below 
call plug#begin('~/.vim/plugged')
" color scheme
Plug 'morhetz/gruvbox'
" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" git plugin
Plug 'tpope/vim-fugitive'
" undo tree
Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-test/vim-test'

call plug#end()

colorscheme gruvbox
set background=dark

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Set <leader> key to space
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <C-p> :GFiles<CR>

nmap <leader>tn :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

