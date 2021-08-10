" Install plug.vim plugin manager if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" Give more space for displaying messages.
set cmdheight=2
" Syntax highlighting
syntax on
" I don't want to hear anything
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
" I don't want to see -- INSERT -- because airline
set noshowmode
" Highlight line with cursor
set cursorline
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
" Move cursor to word when searching
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
" Don't update the display while executing macros
set lazyredraw
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu. See :help 'wildmenu'
set wildmenu
" spell checker
" set spell spelllang=en_us
" vim-plug plugin manager
" see mappings below 
call plug#begin('~/.vim/plugged')
" color scheme
Plug 'NLKNguyen/papercolor-theme'
" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" git plugin
Plug 'tpope/vim-fugitive'
" undo tree
Plug 'mbbill/undotree'
" Fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"gtesting
Plug 'vim-test/vim-test'
" z jump around
Plug 'lingceng/z.vim'
" Status line
Plug 'vim-airline/vim-airline'
" Toggle hybrid relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Autosave
Plug '907th/vim-auto-save'
" easy motion
Plug 'easymotion/vim-easymotion'
call plug#end()
" Disable autosave
let g:auto_save = 0
" Colors!
set background=light
colorscheme PaperColor
" Set <leader> key to space
let mapleader = " "
" jk to escape
imap jk <Esc>
nmap <leader>w :w<CR>
nmap <leader>W :wq<CR>
nmap <leader>c :close<CR>
" Navigate windows with leader and hjkl
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Use m for easymotion prefix
" map m <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Undo tree
nnoremap <leader>u :UndotreeToggle<CR>
" Open directory in vertical window to the left
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" fzf
nmap <C-p> :GFiles<CR>
nmap <leader>b :Buffers<CR>
" Ripgrep search
nmap <leader>F :Rg<CR>
" z jump around
nmap <leader>z :Z<Space>
" testing
nmap <leader>tn :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <leader>ev :e ~/.vimrc<cr>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <leader>sv :so ~/.vimrc<cr>
