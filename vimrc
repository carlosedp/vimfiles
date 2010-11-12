filetype off
call pathogen#runtime_append_all_bundles()

source $VIMRUNTIME/mswin.vim
behave mswin

"" a very simple rc for quick run of vim
"" only most needed config is setting here
"
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
set number " show line numbers

"" set GUI font
if has("gui_macvim")
    " set macvim specific stuff
    set guioptions-=L
    set guifont=Inconsolata:h14
else
    set guifont=Inconsolata:h11
endif

"" set initial window size
set lines=40 columns=120

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

set hlsearch
"
"" enable spell check
" :set spell
"" enable mouse
":set mouse=a
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

:nmap ,o o<Esc>

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

"" Prevent tab'ing into MiniBufExplorer
au! BufEnter -MiniBufExplorer- :wincmd j

"" Set current buffer dir as working dir
autocmd BufEnter * lcd %:p:h

"" Strip all trailing whitespace in the current file
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Reindent Code
nnoremap <silent> <leader>R gg=G

" Key Mappings - CarlosEDP
map <tab> <C-W>w
map <silent> <C-tab> :buffer #<CR>
map <silent> <F1> :NERDTreeToggle %:p:h<CR>
map <silent> <F2> :ls<CR>
map <silent> <F3> :bp<CR>
map <silent> <F4> :bn<CR>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

map <silent> <C-F4> :Bclose<CR>

