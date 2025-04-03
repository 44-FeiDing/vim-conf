# vim-conf

This is my vim(not neovim) configuration.

### requirements

- GVIM
- [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip) (_optional_)
- Git
- python3 headers (`sudo dnf install python3-devel`)
- ShellCheck (`sudo dnf install ShellCheck`)
- A c++ compiler (`sudo dnf install gcc-c++`) 
- CMake (`sudo dnf install cmake`)
- Bash language server (`sudo dnf install nodejs-bash-language-server`)
- Vim language server (`sudo npm install -g vim-language-server`)

### Installation
    
```bash
$ cd ~/.config
$ git clone git@github.com:44-FeiDing/vim-conf.git vim/
```

Then start GVIM, plugins will be installed automatically. Please stare at screen to make sure the post-install hook of YouCompleteMe and Vimspector is running correctly.

### Usage

#### [vim-commentary](https://github.com/tpope/vim-commentary)

- `gcc` to comment the current line
- `gc` to comment the selected lines in visual mode

#### [vim-suda](https://github.com/lambdalisue/vim-suda)

- `:SudaWrite` to save file with sudo
- `:SudaRead` to read file with sudo

#### [copilot.vim](https://github.com/github/copilot.vim)

`:Copilot setup` to set up the copilot plugin, press `Alt+y` to accept the suggestion.

#### [vimspector](https://github.com/puremourning/vimspector)

See `:help vimspector-human-mode`.

#### [vim-surround](https://github.com/spope/vim-surround)

Press `S(` to surround the selected text with `()` in visual mode, The same applies to other symbols.

For more details, see `:help surround`.

#### Auto completion and language server

> When the user sees a useful completion string being offered, they press the TAB key to accept it. This inserts the completion string. Repeated presses of the TAB key cycle through the offered completions. -- ycm main page

Press `Ctrl+i` to expand the snippet, `Ctrl+b` to jump forward, `Ctrl+z` to jump backward.

##### lsp capability

- `gd` to go to the definition
- `gy` to go to the type definition
- `gi` to go to the implementation
- `gr` to go to the references
- `gn` to go to the include file
- `<leader>rn` to rename the symbol under the cursor.
- `<leader>f` to enable quick fix.

#### [mesonic](https://github.com/igankevich/mesonic)

`:MesonInit` to setup in `build/` directory, `:make` to compile.

#### [vim-fugitive](https://github.com/tpope/vim-fugitive)

I forgot it.
