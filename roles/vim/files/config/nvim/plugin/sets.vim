set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set relativenumber
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set encoding=UTF-8

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and a poor user experience
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set isfname+=@-@

" Splits
set splitbelow        " open a new vertical split below
set splitright        " open a new horizontal split on the right
set fillchars=vert:│

set pyx=3
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" Use the system register
set clipboard^=unnamed



" -----------------------
" DevIcon settings
" -----------------------
" loading the plugin
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
