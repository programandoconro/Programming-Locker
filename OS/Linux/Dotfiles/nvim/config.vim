"""""""""""""" vim config
set noswapfile nobackup
set undofile undodir=~/.config/nvim/undodir 
set autoindent expandtab tabstop=2 shiftwidth=2
set mouse=

let g:NERDTreeWinSize = 40


"""""""""" Remember position of last edit and return on reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""" Search expression in files of given path
command! -bang -nargs=* Rg2
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)
