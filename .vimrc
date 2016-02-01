set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Code completion
Plugin 'Valloric/YouCompleteMe'

" Status bar
Plugin 'https://github.com/vim-airline/vim-airline.git'

" Display buffers in status bar
Plugin 'https://github.com/bling/vim-bufferline.git'

" search function
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'

" sidebar to view tags
Plugin 'https://github.com/majutsushi/tagbar.git'

" note taking
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xolox/vim-notes.git'

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

"solarized theme
Plugin 'https://github.com/altercation/vim-colors-solarized.git'

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

"enable colorscheme
let g:solarized_termcolors=16
set t_Co=16
set background=dark
colorscheme solarized

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

" change leader key
let mapleader=","

" shortcuts for tabs 
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>n :tabnext<CR>
nnoremap <silent> <leader>p :tabprevious<CR>

" Visual block remapping
nnoremap <silent> <leader>v <C-V>
inoremap <leader>v <esc><C-V>

"switch between windows
nnoremap <leader>l <C-w><Right>
nnoremap <leader>h <C-w><Left>
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

" expand auto braces
let delimitMate_expand_cr = 1

" notes directory
:let g:notes_directories = ['~/Documents/Notes']

" types :help index.txt to view all availabe key mappings
" increase/decrease vertical window size
nnoremap <silent> <leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <leader>- :exe "vertical resize -5"<CR>

" toggle tagbar
nnoremap <silent> <leader>b :TagbarToggle<CR>

" CTRL-P shortcuts
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>m :CtrlPTag<cr>

nnoremap <silent> <leader>1 :Explore<CR>
nnoremap <silent> <leader>2 :Vexplore<CR>

" change spaces to tabs
nnoremap <silent> <leader><tab> :%retab!<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" open a tag in new tab
nnoremap <silent> <Leader>F <C-w><C-]><C-w>T

" theme for airline status bar - must copy theme to
" ~/.vim/bundle/vim-airline/autoload/airline/themes/
let g:airline_theme='solarized'

" used to show tabs and spaces using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" disable airline whitespace detection
let g:airline#extensions#whitespace#enabled = 0

" default autocomplete file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" use space to navigate backwards through autocomplete list
let g:ycm_key_list_previous_completion = ['<Space>', '<Up>']

" don't ask to load .ycm config files
"let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/Documents/ClassesSprg16/IndependentStudy/pyxis/srb_CnavFilter/*']
