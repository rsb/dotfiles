call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'preservim/nerdtree'

  " telescope requirements...
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let loaded_matchparen = 1
let mapleader = " "

" fast escape out of insert mode without having to stretch your pinky
inoremap jj <esc>


nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_RSB
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

