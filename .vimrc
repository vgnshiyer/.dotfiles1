" Basic
set number
set cursorline
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set wrap
set linebreak
set clipboard=unnamedplus
set backspace=indent,eol,start

" pluggins
call plug#begin()
    " lsp plugins
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " theme pluggins
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'itchyny/lightline.vim'
call plug#end()

" visual
" catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin_mocha 
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" interface
set wildmode=longest:full,full
set showtabline=2
set laststatus=2
set termguicolors
set noshowmode

" performance
set lazyredraw
set updatetime=300
set timeoutlen=500

" lsp-config
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)          " Go to definition
    nmap <buffer> gs <plug>(lsp-document-symbol-search) " Search document symbols
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search) " Search workspace symbols
    nmap <buffer> gr <plug>(lsp-references)          " Find references
    nmap <buffer> gi <plug>(lsp-implementation)      " Go to implementation
    nmap <buffer> gt <plug>(lsp-type-definition)     " Go to type definition
    nmap <buffer> <leader>rn <plug>(lsp-rename)      " Rename symbol
    nmap <buffer> [g <plug>(lsp-previous-diagnostic) " Go to previous diagnostic
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)     " Go to next diagnostic
    nmap <buffer> K <plug>(lsp-hover)                " Show hover information
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
