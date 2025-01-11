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
set encoding=utf-8
set mouse=a
set backspace=2
set completeopt-=preview
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set guifont=FiraCode\ Nerd\ Font\ Mono\ 10
let mapleader=","
set t_Co=256
set ignorecase
set smartcase
inoremap jk <Esc>
set clipboard=unnamedplus
nnoremap <S-t> :belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
set scrolloff=5


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" An example of vim-plug section ---------------------------------------------
call plug#begin()
Plug 'junegunn/seoul256.vim'
call plug#end()

silent! colorscheme seoul256

"vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'LunarWatcher/auto-pairs'
  Plug 'ycm-core/YouCompleteMe', { 'branch': 'legacy-vim-8.2' }
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'luochen1990/rainbow'
  Plug 'yegappan/taglist'
  Plug 'tomasr/molokai'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme molokai

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
"let g:ycm_clangd_binary_path = exepath("clangd15")
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{2}', '_' ],
  \ }
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'W'
nnoremap <C-a> :YcmCompleter GoToDefinition<CR>
nnoremap <F2> :YcmCompleter RefactorRename 

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
