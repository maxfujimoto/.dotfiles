" GUI

" Syntax Highliting
syntax on

" Theme
colorscheme spacegray

" Transparent BG
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Line Numbers
set number relativenumber

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Mode Indicator Color
