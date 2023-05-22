lua require('plugins')
lua require('coc')
lua require('remaps')

"""""""""""""" vim config
set noswapfile nobackup
set undofile undodir=~/.config/nvim/undodir 
set autoindent expandtab tabstop=2 shiftwidth=2


"""""""""" Remember position of last edit and return on reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

