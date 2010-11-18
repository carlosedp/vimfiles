filetype off
call pathogen#runtime_append_all_bundles()

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible

"" Hides the buffer instead of closing. Allows switch unsaved buffers.
set hidden

"" No backup and swap files
set nobackup
set noswapfile

source $VIMRUNTIME/mswin.vim
behave mswin

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible
"
"" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set number " show line numbers

"" set GUI font
if has("gui_macvim")
    " set macvim specific stuff
    " Remove left scrollbar
    set guioptions-=L
    "set guifont=Inconsolata:h14
    "set guifont=Droid\ Sans\ Mono:h10
    set guifont=Consolas:h11
else
    "set guifont=Inconsolata:h11
    set guifont=Consolas:h11
    "set guifont=Droid\ Sans\ Mono:h10
endif

"" Set initial window size only on GUI
if has("gui_running")
    set lines=40 columns=120
endif

"" Set narrow linespace
set linespace=0

"
"" set filetype check on
:filetype plugin indent on
syntax on 
set t_Co=256 " 256 colors
set background=dark 
"colorscheme ir_black
"colorscheme desert 
"colorscheme herald 
"colorscheme vividchalk
colorscheme molokai

"
"" enable spell check
" :set spell
"" enable mouse
:set mouse=a
"
"" set search ignorecase 
:set ignorecase
set smartcase
set scrolloff=3
"
:set sessionoptions+=unix,slash
"
"" encodings configure
:set fileencoding=utf-8
:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,gb2312,cp936
"
"" set tabstop value and shift width 
:set ts=4
:set sw=4
:set expandtab
"
set wrap
set textwidth=79
set formatoptions=qrn1

""setting about indent
:set autoindent
:set smartindent
"
""setting about old window resizing behavior when open a new window
:set winfixheight
"" not let all windows keep the same height/width
:set noequalalways

""Highlight current line and set color
set cursorline

:nmap ,o o<Esc>

"" Remaps search
nnoremap / /\v
vnoremap / /\v
set gdefault


"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
        normal 0 
    endif
endfunction

"" NERDTree Parameters
"" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

"" Open NERDTree in same dir
let NERDTreeChDirMode=1


"" Set BufTabs parameters
:let g:buftabs_only_basename=1
set laststatus=2
:let g:buftabs_in_statusline=1

"" Set current buffer dir as working dir
autocmd BufEnter * lcd %:p:h

"" Key Mappings

"" Strip all trailing whitespace in the current file
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Reindent Code
nnoremap <silent> <leader>R gg=G

"" Toggle Last used files list
nnoremap <silent> <leader>m :MRU<CR>

"" Duplicates current line
nnoremap <leader>d Yp<CR>

"" Cycles between windows
nmap <tab> <C-W>w

"" Cycles between buffers
map <silent> <C-tab> :buffer #<CR>

"" Toggles NERDTree
map <silent> <F1> :NERDTreeToggle %:p:h<CR>

"" List/Next/Previous buffers
map <silent> <F2> :ls<CR>
map <silent> <F3> :bp<CR>
map <silent> <F4> :bn<CR>

"" Find current file in NERDTree
map <silent> <C-f> :NERDTreeFind<CR>

"" Maps cut/copy/paste like Windows 
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"" Closes buffer but keep window open. Opens clear buffer
nmap <silent> <C-F4> :Bclose<CR>
nmap <C-x> :Bclose<CR>
"nmap <C-S-x> :Bclose!<CR>

