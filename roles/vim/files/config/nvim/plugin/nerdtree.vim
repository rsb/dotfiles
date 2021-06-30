let g:NERDTreeShowHidden=1 " Always show dot (hidden) files
let g:NERDTreeQuitOnOpen=1 " Close the NERDTree after opening a file
let g:NERDTreeMinimalUI=1
nnoremap <leader>n :NERDTreeFocus<CR>
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
