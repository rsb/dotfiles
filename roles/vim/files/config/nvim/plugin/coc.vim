let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:ale_linters = { 'go': ['gopls'] }

autocmd FileType json syntax match Comment +\/\/.\+$+
