syntax enable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set showcmd
" filetype indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
set nowrap
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
call vundle#end()            " required

filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'roosta/srcery'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'

call plug#end()

if has("autocmd")
	 au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
	 au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
	au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"  
endif

let g:jsx_ext_required = 0
