call plug#begin('~/.vim/plugged')

Plug 'maxmellon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['html','javascript', 'css', 'json', 'graphql'] }
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
Plug 'stevearc/vim-arduino'


Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'react', 'yaml', 'html'] }
Plug 'mlaursen/vim-react-snippets'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'junegunn/fzf', {'do': { ->fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'


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
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx Neoformat
augroup END
let g:vim_jsx_pretty_colorful_config = 1
nnoremap = ==
map <F2> iimport React from 'react'; <CR><CR>export default function myFunction(props){ <CR><CR>  return( <CR><CR> ); }
map <F3> iimport React,{useState} from 'react'; <CR><CR>export default function myFunction(props){ <CR>const [state, setState] = useState(); <CR><CR>  return( <CR><CR> ); }
map <F4> iimport React, {useState,useEffect} from 'react'; <ESC> o <CR>
map <F5> iexport default function myFunction(props){ return(  ); } <ESC>
map <F6> iconst [state, handleState] = useState(); <ESC> 0
map <leader>s :w <CR>i
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
