" Install plug.vim plugin manager if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
 http://localhost:8080 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
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
" Start scrolling before cursor hits bottom of page
set scrolloff=5
" Set keycode delays to 0 so CTRL-[ updates immediately
set timeoutlen=1000 ttimeoutlen=0
" Syntax highlighting
syntax on
" Make syntax highlighting faster by using vim 8 regex
set re=0
" I don't want to hear anything
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" more powerful backspacing
set backspace=indent,eol,start  
" Hide modified files into buffers
set hidden
" Automatically read file changes from outside of vim
set autoread
" Automatically saves file if you move to a different file or exit
set autowriteall
" Save when you leave focus of vim
:au FocusLost * silent! wa
" Line numbers
set number
" I don't want to see -- INSERT -- because airline will already tell me
set noshowmode
" Highlight line with cursor
set cursorline
" Good indents
set tabstop=4
set expandtab
" Backspace deletes 4 spaces.
set softtabstop=4
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
" Smoother scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
" Copy to system clipboard with yank
set clipboard=unnamed
" Color the 80 column light grey
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Don't update the display while executing macros
set lazyredraw
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
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
" :PlugInstall to install new plugins
" :PlugUpdate to update plugins
" color scheme
Plug 'NLKNguyen/papercolor-theme'
" code completion
if $NVM_BIN != ""
  let g:coc_node_path = '$NVM_BIN/node'
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" git plugin
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
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
" Git blame in status line
Plug 'zivyangll/git-blame.vim'
" Toggle hybrid relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" File settings for more files
Plug 'sheerun/vim-polyglot'
" Github colorscheme
Plug 'cormacrelf/vim-colors-github'
" Config and bindings for netrw
Plug 'tpope/vim-vinegar'
" Surround sound
Plug 'tpope/vim-surround'
" Enable . to repeat commands
Plug 'tpope/vim-repeat'
" Pairs of handy bracket mappings e.g. [
Plug 'tpope/vim-unimpaired'
" Coffeescript
Plug 'kchmck/vim-coffee-script'
" easy motion
" Plug 'easymotion/vim-easymotion'
call plug#end()
" Colors!
set termguicolors
set background=light
colorscheme github
let g:airline_theme = "github"
" Set <leader> key to space
let mapleader = " "
" Use m for easymotion prefix
" map m <Plug>(easymotion-prefix)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" Rust config
nmap <leader>mf :RustFmt<cr>
" Run test under cursor
nmap <leader>ms :RustTest<cr>
" Run all tests
nmap <leader>ma :RustTest!<cr>
" COC config
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
nmap <leader>af :CocAction<cr>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
" find fu(s)y
nmap <leader>fs :Rg<CR>
" Not fuzzy search, find all
nmap <leader>fa :Rg<space>
" Lines in current file
nmap <leader>fl :Lines<CR>
nmap <leader>fi :GFiles<CR>
" git status
nmap <c-g><c-k> :GFiles?<CR>
" Full screen window without border
" let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'border': 'none' }}
" Only left border on preview window, the option border-none doesn't work
let g:fzf_preview_window = ['right']
" Popup window
" let g:fzf_layout = { 'window': {}}
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Quick close with ctrl [ ctrl p
nmap <C-p> ZZ<CR>
nmap <leader>b :Buffers<CR>
" z jump around
nmap <leader>z :Z<Space>
" netrw config
" let g:netrw_keepdir = 0
" Tree list style
let g:netrw_liststyle = 3
" Open current working directory
" Wipeout netrw buffers when they are hidden.
augroup AutoDeleteNetrwHiddenBuffers
au!
au FileType netrw setlocal bufhidden=wipe
augroup end
nmap _ :Explore .<CR>

" testing
" nmap <leader>tn :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>
nmap <leader>w :w<cr>
" Let's make it easy to edit this file (mnemonic for the key sequence is 'v'im
" 'v'imrc)
nmap <leader>ev :e ~/.vimrc<cr>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <leader>sv :w<cr>:so ~/.vimrc<cr>
" Run a vim command in each lines in your specified range, use V selection
" first
vmap <leader>no :norm 
" Comment the lines with a #
vmap <leader>3 :norm i# <cr>
" Select the whole file
nmap <leader>ag ggVG
" Go to last file
nmap <leader>o <c-6>
" Up and down for autocomplete window
imap <c-j> <down>
imap <c-k> <up>
