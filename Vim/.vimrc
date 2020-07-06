call plug#begin('~/.vim/plugged')
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'npn install', 'for': ['html','javascript', 'css', 'json', 'graphql'] }
Plug 'kien/ctrlp.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'flowtype/vim-flow'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'jparise/vim-graphql'
Plug 'elzr/vim-json'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/goyo.vim'
Plug 'rakr/vim-one'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'

Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'react', 'yaml', 'html'] }
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'junegunn/fzf', {'do': { ->fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

syntax on

" COLORSCHEME 
set t_Co=256
" FOR LIGHT
" colorscheme one
" set background=light
" let g:airline_theme='one'
" let g:one_allow_italics = 1

" FOR DARK
let g:airline_theme='monokai_tasty'
let g:vim_monokai_tasty_italic = 1

highlight Comment cterm=italic
if (has("termguicolors"))
  set termguicolors
endif

set guifont=Ubuntu\ Mono\ 11
set noswapfile
set tabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
colorscheme gruvbox
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(cor-references)
nnoremap <C-p> :GFiles<CR>


set background=dark

" LINTER SETTINGS
" ------------------------------------------------

let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }


let g:ale_sign_error = '@'
let g:ale_sign_warning = '!!'

let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_change = 'never'


" NERDTree
" -----------------------------------------------

" --------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" --------------------------------------------------
set number               
set encoding=UTF-8
set expandtab
set shiftwidth=2
set softtabstop=2
let g:UltiSnipsExpandTrigger="<C-l>"

let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.htm PrettierAsync

" Key shortcuts
" ------------------------------------------------
nnoremap <F2> :buffers<CR>:buffer<Space>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap ı i
map <F8> ggVG
map <C-S-l> :Prettier<CR>
map <F12> :ALEGoToDefinition<CR>
nnoremap ,<space> :nohlsearch<CR>


"-- AUTOCOMPLETION --"
filetype plugin on
set omnifunc=syntaxcomplete#Complete


" Highlight currently open buffer in NERDTree

" comment out: 
" - gcc to commentout single line
" - gc to commentout the target of a motion

hi Normal guibg=NONE ctermbg=NONE


