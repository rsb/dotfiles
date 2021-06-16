set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'simrat39/symbols-outline.nvim'

  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'

  Plug 'rust-lang/rust.vim'
  Plug 'darrikonn/vim-gofmt'
  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'

  " telescope requirements...
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let loaded_matchparen = 1
let mapleader = " "

" fast escape out of insert mode without having to stretch your pinky
inoremap jj <esc>

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_RSB
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

