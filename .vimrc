syntax enable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set showcmd
" filetype indent on
set wildmode=longest:full
set wildmenu
set showmatch
set incsearch
set hlsearch
set lazyredraw
set foldenable
set foldnestmax=10
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'AndrewRadev/switch.vim'

call vundle#end()            " required

filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'roosta/srcery'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/matchit.zip'

call plug#end()

let g:jsx_ext_required = 0

"" COLORS
colorscheme srcery

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:ycm_autoclose_preview_window_after_insertion = 1

" airliner
let g:airline_theme='simple'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
set laststatus=2


" MAPPINGS
" =========================================
let mapleader = " "

" Open fuzzy file search
nnoremap <leader>f :Files<CR>
" Open fuzzy command search
nnoremap <leader>c :Commands<CR>

" Switch tabs with actual tabes
map <Tab> <ESC>gt<CR>
map <S-TAB> <ESC>gT<CR>

" Switch case on letter
map <leader>` ~

" Insert or remove tabs in insert mode
imap <Tab> <C-t>
imap <S-TAB> <C-d>

" Toggle bools and stuff
nnoremap <leader><Tab> :Switch<CR><CR>
" open/close object, open means on multiple lines, close means one line
map <buffer> <leader>{ ^f{f}bea,<esc>:s/,/,\r/g<cr>%a<cr><esc>=a}:nohl<cr>
map <buffer> <leader>} ]}k$xva}J
