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

  "Plug 'gruvbox-community/gruvbox'
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
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "Plug 'darrikonn/vim-gofmt'
  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'

  " telescope requirements...
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'


  Plug 'wellle/targets.vim'
  "Plug 'junegunn/vim-peekaboo'

  Plug 'andymass/vim-matchup'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired'
  Plug 'alvan/vim-closetag'
  Plug 'machakann/vim-sandwich'
  "Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
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



" Setting up the Terminal
" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
let g:peekaboo_prefix = " "
