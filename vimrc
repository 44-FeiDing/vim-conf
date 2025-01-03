vim9script
#base 
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
set guifont=Fira\ Code\ 10
g:mapleader = ","
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



#vim-plug
plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'LunarWatcher/auto-pairs'
  Plug 'ycm-core/YouCompleteMe', { 'branch': 'legacy-vim-8.2' }
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'luochen1990/rainbow'
  Plug 'yegappan/taglist'
plug#end()

#taglist
g:Tlist_Use_Right_Window = 1
map <C-k> :TlistToggle<CR>

#NerdTree
map <C-s> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
g:NERDTreeFileLines = 1
g:NERDTreeShowHidden = 1


#auto-pairs
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
g:AutoPairsMultilineClose = 0


#ycm
#let g:ycm_clangd_binary_path = exepath("clangd15")
g:ycm_semantic_triggers =  {
     'c,cpp,objc': [ 're!\w{2}', '_' ],
   }
g:ycm_error_symbol = 'E'
g:ycm_warning_symbol = 'W'
nnoremap <C-a> :YcmCompleter GoToDefinition<CR>
nnoremap <F2> :YcmCompleter RefactorRename 

#ranbow
g:rainbow_active = 1 #0 if you want to enable it later via :RainbowToggle
g:rainbow_conf = {
    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    'operators': '_,_',
    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    'separately': {
        '*': {},
        'tex': {
            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
        },
        'lisp': {
            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
        },
        'vim': {
            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
        },
#        'html': {
#            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
#        },
        'css': 0,
        'nerdtree': 0, 
    }
}


#airline
#Should install powerline-fonts at the package manager first
g:airline_powerline_fonts = 1
g:bufferline_echo = 0

