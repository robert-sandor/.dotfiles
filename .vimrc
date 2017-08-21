" leave vi compatibility behind
set nocompatible

set history=500

filetype plugin on
filetype indent on

" automatically read a file changed from the outside
set autoread

" set comma as map leader
let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

" set 7 lines to the cursor
set so=7

" turn on the wildmenu
set wildmenu

" always show current position
set ruler

" command bar height
set cmdheight=2

" ignore case when searching, but try to be smart about it
set ignorecase
set smartcase

" highlight search results
set hlsearch

" search like in modern browsers
set incsearch

" don't redraw when executing macros
set lazyredraw

" magic regex
set magic

" matching brackets
set showmatch
set mat=2

" remove annoying error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" enable syntax highlighting
syntax enable

" set a standard utf-8 encoding
set encoding=utf8

" remove backups and such (git is way better)
set nobackup
set nowb
set noswapfile

" use spaces instead of tabs
set expandtab
set smarttab
" 1 tab is 4 spaces
set shiftwidth=4
set tabstop=4

set ai " auto indent
set si " smart indent
set wrap " wrap the lines

" map space to search, and ctrl-space to backwards search
map <space> /
map <c-space> ?

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" smarter way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" close all the buffers
map <leader>ba :bufdo bd<cr>

" move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t:<leader> tabnext

" show the status line
set laststatus=2

" status line format
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" remap 0 to the first non-blank character
map 0 ^

" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set number
set relativenumber
