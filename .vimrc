set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" git wrapper
Plugin 'tpope/vim-fugitive'

" gcc comment current line
Plugin 'git://github.com/tpope/vim-commentary.git'

" alignment helper
Plugin 'godlygeek/tabular'
" markdown syntax (requires tabular)
Plugin 'plasticboy/vim-markdown'

"Auto close braces
Plugin 'https://github.com/Raimondi/delimitMate.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" enable syntax highlighting
syntax enable

" show status line all the time
set laststatus=2

" show line numbers
set number

" set tab size
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" set jj as key combo to exit insert mode
imap jj <esc>

" set default behaviour for split window 
set splitbelow
set splitright

" set default netrw (explore) view style
let g:netrw_liststyle=3
nnoremap :E :Vexplore

" change leader key
let mapleader=","

" shortcuts for tabs 
nnoremap <silent> <leader>t :tabnew<CR>
inoremap <leader>t <Esc>:tabnew<CR>
nnoremap <silent> <leader>n :tabnext<CR>
inoremap <leader>n <esc>:tabnext<CR>
nnoremap <silent> <leader>p :tabprevious<CR>
inoremap <leader>p <Esc>:tabprevious<CR>

" Visual block remapping
nnoremap <silent> <leader>v <C-V>
inoremap <leader>v <esc><C-V>

"switch between windows
nnoremap <C-r> <C-w><Right>
nnoremap <C-l> <C-w><Left>

" expand auto braces
let delimitMate_expand_cr = 1

