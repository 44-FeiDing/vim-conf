"base 
syntax on
set nu
set ruler
set nocompatible
set autowrite
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set relativenumber
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set completeopt-=preview
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set guifont=FiraCode\ Nerd\ Font\ 12
set ambiwidth=double
let mapleader=","
set t_Co=256
set ignorecase
set smartcase
set clipboard=unnamedplus
inoremap jk <Esc>
nnoremap <leader>t :belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
"keep cursor away from top or bottom
set scrolloff=5 
au InsertLeave * write


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'LunarWatcher/auto-pairs'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'preservim/tagbar'
    Plug 'tomasr/molokai'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme molokai

"tagbar
noremap <leader>k :TagbarToggle<CR>

"NerdTree
map <leader>e :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeFileLines = 1
let NERDTreeShowHidden=1


"auto-pairs
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
let g:AutoPairsMultilineClose = 0


"ycm
"let g:ycm_clangd_binary_path = exepath("clangd15")
let g:ycm_semantic_triggers =  {
            \   'c,cpp,objc': [ 're!\w{2}', '_' ],
            \ }
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
let g:ycm_clangd_args = [ '--header-insertion=never' ]
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 

"rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"airline
"Should install powerline-fonts at the package manager first
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
