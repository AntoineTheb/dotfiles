syntax enable
set backupcopy=yes
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
set switchbuf+=usetab,newtab
set nocompatible              " be iMproved, required
filetype off                  " required

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'AndrewRadev/switch.vim'
Plugin 'roosta/srcery'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'mhinz/vim-grepper'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call vundle#end()            " required

filetype plugin indent on    " required
let g:jsx_ext_required = 0

"" COLORS
colorscheme srcery

" ESLINT
" =========================================
let g:neomake_javascript_enabled_makers = ['standard']
if findfile('.eslintrc', '.;') !=# ''
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_jsx_enabled_makers = ['eslint']
    let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
endif
let g:neomake_open_list = 2

autocmd! BufWritePost *.js Neomake

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:ycm_autoclose_preview_window_after_insertion = 1

" airliner
let g:airline_theme='simple'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2

" deoplete
let g:deoplete#enable_at_startup = 1

" MAPPINGS
" =========================================
let mapleader = " "

" Open fuzzy file search
nnoremap <leader>f :Files<CR>
" Open fuzzy command search
nnoremap <leader>c :Commands<CR>

nnoremap <leader>g :GrepperAg

nnoremap <leader>h #:GrepperAg<cword><CR>

" Switch tabs with actual tabes
map <Tab> <ESC>gt<CR>
map <S-TAB> <ESC>gT<CR>

" Switch case on letter
map <leader>` ~

" Insert or remove tabs in insert mode
imap <Tab> <C-t>
imap <S-TAB> <C-d>

" open/close object, open means on multiple lines, close means one line
nnoremap <buffer> <leader>{ ^f{f}bea,<esc>:s/,/,\r/g<cr>%a<cr><esc>=a}:nohl<cr>
nnoremap <buffer> <leader>} ]}k$xva}J
