" sudo dnf install ShellCheck cmake g++ python3-devel nodejs-bash-language-server
" sudo npm install -g vim-language-server

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " color scheme
    Plug 'tomasr/molokai'

    " tiny game
    Plug 'vim/killersheep'

    " comment
    Plug 'tpope/vim-commentary'

    " rainbow parentheses
    Plug 'luochen1990/rainbow'

    " status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " startify
    Plug 'mhinz/vim-startify'

    " convinient sudo
    Plug 'lambdalisue/vim-suda'

    Plug 'Yggdroot/indentLine'

    Plug 'github/copilot.vim'

    " debugger
    Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-bash --enable-python --enable-cpp' }

    " file explorer
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'PhilRunninger/nerdtree-visual-selection'

    " auto pair
    Plug 'LunarWatcher/auto-pairs'
    Plug 'tpope/vim-surround'

    " completer
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " meson
    Plug 'igankevich/mesonic'

    " git
    Plug 'tpope/vim-fugitive'

    Plug 'ryanoasis/vim-devicons'
    
call plug#end()



" Options

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
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set completeopt-=preview
set guifont=FiraCode\ Nerd\ Font\ Mono\ 10
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set t_Co=256
set ignorecase
set smartcase
set clipboard=unnamedplus
set scrolloff=3
set background=dark
set hidden
set backup
set writebackup
set updatetime=100
set shortmess+=c
colorscheme molokai



" Keymaps
let g:mapleader = " "
let g:maplocalleader = " "
inoremap jk <Esc>
nnoremap <leader>t <CMD>belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> <CMD>resize -2<CR>
nnoremap <C-Down> <CMD>resize +2<CR>
nnoremap <C-Left> <CMD>vertical resize -2<CR>
nnoremap <C-Right> <CMD>vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <ESC> <CMD>nohlsearch<CR>


" NerdTree
nnoremap <leader>e <CMD>NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

let g:NERDTreeFileLines = 1
let NERDTreeShowHidden=1


" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'separately': {
        \ 'nerdtree': 0,
        \ 'startify': 0,
        \ 'gitcommit': 0,
        \ 'vimwiki': 0,
        \ 'markdown': 0,
        \ 'help': 0,
    \ },
    \ }

" Airline
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1


" YouCompleteMe
nnoremap gd <cmd>YcmCompleter GoToDefinition<cr>
nnoremap gy <cmd>YcmCompleter GoToType<cr>
nnoremap gi <cmd>YcmCompleter GoToImplementation<cr>
nnoremap gr <cmd>YcmCompleter GoToReferences<cr>
nnoremap gn <cmd>YcmCompleter GoToInclude<cr>
nnoremap <leader>rn <cmd>YcmCompleter RefactorRename
nnoremap <leader>f <cmd>YcmCompleter FixIt<cr>

let g:ycm_complete_in_strings = 0
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc,python,py,sh,bash,vim': [ 're!\w{3}', '_' ],
  \ }

let g:ycm_language_server =
            \ [
            \   {
            \       'name': 'bash',
            \       'cmdline': [ 'bash-language-server', 'start' ],
            \       'filetypes': [ 'sh' ],
            \   },
            \   {
            \       'name': 'vimls',
            \       'cmdline': [ 'vim-language-server', '--stdio' ],
            \       'filetypes': [ 'vim' ],
            \   },
            \ ]


" snip
let g:UltiSnipsExpandTrigger="<C-i>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" let g:UltiSnipsEditSplit="vertical"

" Copilot
inoremap <silent><script><expr> <A-y> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'vscode-bash-debug' ]
