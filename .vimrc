set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" quick search
Plugin 'https://github.com/justinmk/vim-sneak.git'

" Keep Plugin commands between vundle#begin/end.

Plugin 'https://github.com/tpope/vim-sensible.git'

" netrw enhancments
Plugin 'https://github.com/tpope/vim-vinegar.git'

" ctags highlighter
Plugin 'https://github.com/abudden/taghighlight-automirror.git'
Plugin 'https://github.com/gauravjuvekar/abudden-EasyColour.git'

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
" auto update ctags
Plugin 'https://github.com/xolox/vim-easytags.git'

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

" allows switching of buffers without a save
set hidden

"enable colorscheme
let g:solarized_termcolors=16
set t_Co=16
set background=dark
colorscheme solarized

" show status line all the time
set laststatus=2

" case insensitive seach (use \C for case sensitive)
set ignorecase

" show line numbers
set number

" use spaces instead of tabs
" set all tabs and indentations to a width of 4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" set jj as key combo to exit insert mode
imap jj <esc>

" set default behaviour for split window
set splitbelow
set splitright

" set default netrw view style
" let g:netrw_liststyle=0

" default hide dot files in netrw
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

" change leader key
let mapleader=","

" spell check
nnoremap <silent> <leader>s :setlocal spell spelllang=en_us<CR>

" open new empty buffer
nnoremap <silent> <leader>t :enew<CR>
" Move to the next buffer
nnoremap <silent> <leader>n :bnext<CR>
" Move to the previous buffer
nnoremap <silent> <leader>p :bprevious<CR>
" shortcuts for tabs
nnoremap <silent> <leader>T :tabnew<CR>
nnoremap <silent> <leader>N :tabnext<CR>
nnoremap <silent> <leader>P :tabprevious<CR>

"switch between windows
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
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
nnoremap <silent> <leader>2 :Lexplore<CR>

" change spaces to tabs
nnoremap <silent> <leader><tab> :%retab!<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
"let g:netrw_browse_split = 4
" change from left split to right split
" let g:netrw_altv = 1

" open a tag in new tab
nnoremap <silent> <Leader>F <C-w><C-]><C-w>T

" theme for airline status bar - must copy theme to
" ~/.vim/bundle/vim-airline/autoload/airline/themes/
let g:airline_theme='solarized'

" used to show tabs and spaces using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" default autocomplete file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" set key to navigate backwards through autocomplete list
let g:ycm_key_list_previous_completion = ['<leader><Tab>', '<Up>']

" don't ask to load .ycm config files
let g:ycm_confirm_extra_conf = 0

let g:ycm_show_diagnostics_ui = 1

" don't use preview window for struct definitons
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" YCM settings and shortcuts
" populate errors to list
" :lopen and :lclose to view
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_comments = 1
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>rr :YcmForceCompileAndDiagnostics<CR>

" don't echo open buffers to command line
let g:bufferline_echo = 0

" easytags update option
let g:easytags_async = 1

" save tags file in project dir not as a global file
set tags=./.tags;
let g:easytags_dynamic_files = 1

" the ctags commands to use for easytags
let g:easytags_languages = {
\'c': {
\   'cmd': '/usr/bin/ctags',
\       'args': ['--fields=+l', '--c-kinds=+p'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}

" don't use easytags highlighting -> slows vim
let g:easytags_auto_highlight = 0

" update tags file after save
let g:easytags_events = ['BufWritePost']

" set tags filename for taghighlight
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = '.tags'

" copy and paste to global clipboard
vnoremap <C-c> "+y
nnoremap <silent> <leader>v "+p

" project specific settings -> tabsize 2 for pyxis
au BufRead,BufEnter /home/rane/Documents/ClassesSprg16/IndependentStudy/pyxis/* setlocal ts=2 sts=2 sw=2

" use bash like tab autocompletion
set wildmode=longest:full,full
set wildmenu

" YCM syntax error log
nnoremap <leader>o :lopen<CR>
nnoremap <leader>c :lclose<CR>

" YCM integration with airline status bar
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'Errors:'
let g:airline#extensions#ycm#warning_symbol = 'Warnings:'
