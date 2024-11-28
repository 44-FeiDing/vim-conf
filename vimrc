"base 
syntax on
set nu
set ruler
set nocompatible
set clipboard+=unnamed
set autowrite
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
"set cursorcolumn
set encoding=utf-8
set mouse=a
set completeopt-=preview
colorscheme molokai
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set guifont=Fira\ Code\ Regular\ 10
let mapleader=","
set t_Co=256
inoremap jk <Esc>
"noremap <C-a> ggVG
"vnoremap <C-y> "+y
"nnoremap <C-p> "+gP
set clipboard=unnamedplus
nnoremap <S-t> :belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-a> :YcmCompleter GoToDefinition<CR>
nnoremap <F2> :YcmCompleter RefactorRename 

"vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'luochen1990/rainbow'
  Plug 'yegappan/taglist'
call plug#end()

"taglist
let g:Tlist_Use_Right_Window=1
map<C-k> :TlistToggle<CR>

"NerdTree
map <C-s> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let g:NERDTreeFileLines = 1
let NERDTreeShowHidden=1


"auto-pairs
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
let g:AutoPairsMultilineClose = 0


"ycm
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_min_num_of_chars_for_completion=2
"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_clangd_binary_path = exepath("clangd15")

"ranbow
 let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\		'nerdtree': 0,  
	\		'taglist' : 0,	
	\	}
	\}

"airline
"Should install powerline-fonts at the package manager first
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
