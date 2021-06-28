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

function! s:local_plug(pkg_name) abort " {{{
  if isdirectory(expand("~/workspace/nvim/local/plugins/" . a:pkg_name))
    execute "Plug '~/workspace/nvim/local/plugins/" . a:pkg_name . "'"
  else
    execute "Plug 'rsb/" . a:pkg_name . "'"
  endif
endfunction
" }}}

call plug#begin('~/.vim/plugged')
"  call s:local_plug('cyclist.vim')

" Plug 'gruvbox-community/gruvbox'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'simrat39/symbols-outline.nvim'

  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'arcticicestudio/nord-vim'

  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'

  Plug 'rust-lang/rust.vim'
  "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
  Plug 'wellle/targets.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'andymass/vim-matchup'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  "Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired'
call plug#end()
colorscheme nord
highlight Normal guibg=none
let loaded_matchparen = 1
let mapleader = " "

" fast escape out of insert mode without having to stretch your pinky
inoremap jj <esc>
" visual mode: select the whole file
nmap Q ggvG

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_RSB
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END


