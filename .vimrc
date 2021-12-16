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
nmap gr <Plug>(coc-references)
" Use K to show do(K)umentation in preview window.
nnoremap K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" coc-gi(t) https://github.com/neoclide/coc-git
nmap <leader>tb :CocCommand git.browserOpen<CR>
nmap <leader>tl :CocCommand git.copyUrl<CR>
nmap <leader>ts :CocCommand git.chunkStage<CR>
nmap <leader>tu :CocCommand git.chunkUndo<CR>
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" Git blame https://github.com/zivyangll/git-blame.vim
nnoremap <Leader>tm :<C-u>call gitblame#echo()<CR>

" Symbol renaming.
nmap <leader>re <Plug>(coc-rename)
" COC Extenstions
let g:coc_global_extensions = [
      \'coc-highlight',
      \'coc-go',
      \'coc-python',
      \'coc-json',
      \'coc-git',
      \'coc-sh',
      \'coc-java',
      \'coc-rust-analyzer'
      \]
" enable highlight current symbol on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Undo tree
nnoremap <leader>u :UndotreeToggle<CR>
" fzf config
" Search in fzf with ripgrep instead of fzf with :RG
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>1)

" Redefine Rg command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --glob "!**/.git/**" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" fuzzy file search
nmap <leader>fi :GFiles<CR>
nmap <leader>fI :Files<CR>
" fuzzy Ripgrep search, find fu(s)y
nmap <leader>fs :Rg<CR>
" Not fuzzy search, find all
nmap <leader>fa :Rg<space>
" Lines in current file
nmap <leader>fl :Lines<CR>
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
" Java commands
" 
nmap <leader>jil i{@link }<esc>i
nmap <leader>jcl ciw{@link <c-r>"}<esc>
