set number
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "."
syntax on

set cursorline
set incsearch
set hlsearch
set ignorecase

set nocompatible
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf8
set backspace=indent,eol,start
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/papis/papis-vim.git'
" Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/badwolf'
"Plugin 'ayu-theme/ayu-vim'
"Plugin 'sickill/vim-monokai'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'junegunn/fzf.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'zxqfl/tabnine-vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
"Plugin 'romainl/flattened'
Plugin 'ryanoasis/vim-devicons'
Plugin 'rhysd/vim-clang-format'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
" Plugin 'easymotion/vim-easymotion'
"Plugin 'kshenoy/vim-signature'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'airblade/vim-gitgutter'

"-- PLUGINS (Using junegunn/vim-plug) --
Plugin 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'jistr/vim-nerdtree-tabs'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
endif
Plugin 'lervag/vimtex'
let g:indentLine_color_gui = '#45413b'
let g:indentLine_char = '┊'
let g:indentLine_filetypeExclude = [ 'markdown', 'json' ]

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:user_emmet_leader_key=','
colorscheme badwolf
" Javascript folding
"-- FOLDING --  
set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened
" Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" VIMTEX
let g:tex_flavor = 'latex'

" Starting to use vimtex and it needs several configurations to work correctly
let g:vimtex_fold_enabled = 0
let g:vimtex_indent_enabled = 1
let g:vimtex_complete_recursive_bib = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
call vimtex#imaps#add_map({
  \ 'lhs' : '<m-i>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate", "compactitem"],
  \})
let g:coc_disable_startup_warning = 1


function! PapisBibtexRef()
  let l:temp = tempname()
  echom l:temp
  silent exec "!papis bibtex ref -o ".l:temp
  let l:olda = @a
  let @a = join(readfile(l:temp), ',')
  normal! "ap
  redraw!
  let @a = l:olda
endfunction

command! -nargs=0 BibRef call PapisBibtexRef()
command! -nargs=0 BibOpen exec "!papis bibtex open"

