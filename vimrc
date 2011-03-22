filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible

set modeline

"" Hides the buffer instead of closing. Allows switch unsaved buffers.
set hidden

"" No backup and swap files
set nobackup
set noswapfile

"" Disable ALT keys access to menubar. Makes mappings work.
set winaltkeys=no

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible
"

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set number " show line numbers
set showbreak=...

"" Disable bell
set vb

"" Set GUI Options and scrollbars
set guioptions=egmrLtTb

"" Remove the 'tear bla bla from menus'
set guioptions-=t

"" Automatically change working dir to current buffer
set autochdir

"" set GUI font
if has("gui_macvim")
    " set macvim specific stuff
    " Remove left scrollbar
    set guioptions-=L
    " make Mac 'Option' key behave as 'Alt'
    set invmmta
    "set guifont=Inconsolata:h14
    "set guifont=Droid\ Sans\ Mono:h10
    set guifont=Consolas:h14
else
    "set guifont=Inconsolata:h11
    set guifont=Consolas:h11
    "set guifont=Droid\ Sans\ Mono:h10
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

"" Set initial window size only on GUI
if has("gui_running")
    set lines=40 columns=120
    set browsedir=buffer
endif

"" encodings configure
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,cp936

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8 bomb
    set fileencodings=ucs-bom,utf-8,default,latin1
endif

"" Set narrow linespace
set linespace=0

" Tab completion
set wildmenu "Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*

"Set magic on, for regular expressions
set magic

source $VIMRUNTIME/mswin.vim
behave mswin

" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l

"
"" set filetype check on
filetype plugin indent on
syntax on
set t_Co=256 " 256 colors
set background=dark
"colorscheme ir_black
"colorscheme desert
"colorscheme molokai
colorscheme Mustang

"
" set English language
language messages en
set langmenu=none

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
    set spl=en spell
    set nospell
endif

"" enable mouse
set mouse=a
"
"" set search ignorecase
set ignorecase
set smartcase
set scrolloff=3

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" No extra space when join lines
set joinspaces

set wrap
set textwidth=79
set formatoptions=qrn1

""setting about indent
set autoindent
set smartindent

" Display invisible characters.
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=eol:?,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist

" add to autocomplete the dictionary
set complete+=k

" for XSL / CSS - completition works great
set iskeyword+=-,:

""setting about old window resizing behavior when open a new window
set winfixheight
"" not let all windows keep the same height/width
set noequalalways

""Highlight current line and set color
set cursorline

" Now you can select both with the mouse and shifted arrow keys and press '>' to indent
set selectmode=

" set inclusive, default is exclusive... but have problem with sorround.vim plugin
set selection=inclusive

nmap ,o o<Esc>

"" Remaps search
nnoremap / /\v
vnoremap / /\v
set gdefault

"" Use Unix format for files
"set sessionoptions+=unix,slash,localoptions
set sessionoptions=buffers,curdir,folds,help,resize,winpos,winsize,tabpages,unix,slash,localoptions

"" Disable code folding
set nofoldenable


"""""""""""""""""""""Functions""""""""""""""""""""""""""""


" Creates a session
function! MakeSession()
    let b:sessiondir = $HOME
    let b:sessionfile = b:sessiondir . '/.session.vim'
    exe "mksession! " . b:sessionfile

endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
    if argc()==0
        let b:sessiondir = $HOME
        let b:sessionfile = b:sessiondir . "/.session.vim"
        if !(filereadable(b:sessionfile))
            :call MakeSession()
        endif
        exe "mksession! " . b:sessionfile
        echo "updating session"
    endif
endfunction

" Loads a session if it exists
function! LoadSession()
    if argc() == 0
        let b:sessiondir = $HOME
        let b:sessionfile = b:sessiondir . "/.session.vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let b:sessionfile = ""
        let b:sessiondir = ""
    endif
endfunction

au VimEnter * :call LoadSession()
au VimLeave * :call UpdateSession()
"map <leader>m :call MakeSession()<CR>

"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function! Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
        normal 0
    endif
endfunction

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


function! NTFinderP()
    "" Check if NERDTree is open
    if exists("t:NERDTreeBufName")
        let s:ntree = bufwinnr(t:NERDTreeBufName)
    else
        let s:ntree = -1
    endif
    if (s:ntree != -1)
        "" If NERDTree is open, close it.
        :NERDTreeClose
    else
        "" Try to open a :Rtree for the rails project
        if exists(":Rtree")
            "" Open Rtree (using rails plugin, it opens in project dir)
            :Rtree
        else
            "" Open NERDTree in the file path
            :NERDTreeFind
        endif
    endif
endfunction

"" NERDTree Parameters
"" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

"" Open NERDTree in same dir
let NERDTreeChDirMode=1


"" Show hidden files by default
"let NERDTreeShowHidden=1

"" Set BufTabs parameters
let g:buftabs_only_basename=1
set laststatus=2
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1

""Set custom filetypes
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ejs set filetype=html.js

"" Set current buffer dir as working dir
"autocmd BufEnter * lcd %:p:h
"autocmd BufEnter * call ReturnDir()

function! ReturnDir()
    if exists(":Rtree")
        lcd `=rails#app().path()`
    else
        lcd %:p:h
    endif
endfunction

function! IndentFile()
    if &filetype == 'javascript'
        let l = line('.')
        let c = col('.')
        call g:Jsbeautify()
        call cursor(l,c)
    else
        let l = line('.')
        let c = col('.')
        execute "normal! gg=G"
        call cursor(l,c)
    endif
endfunction



"" Key Mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Make cursor move as expected with wrapped lines (in insert mode only with Alt key)
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <M-Down> <C-o>gj
inoremap <M-Up> <C-o>gk

" better Shift + Ctrl + Left-Right selection range
vnoremap <S-C-Left> b
vnoremap <S-C-Right> e
nnoremap <C-Left> b
nnoremap <C-Right> e
nnoremap <S-C-Left> vb
nnoremap <S-C-Right> ve

" Fast find selected text
map , y/<C-R>"/<cr>

"" Inserts hard tab in INSERT mode
imap <S-Tab> <C-Q><Tab>

" Make enter useful in normal & visual mode (match tags and brackets)
nmap <C-CR> %
vmap <C-CR> %

"" Strip all trailing whitespace in the current file
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Reindent Code, strip trailing whitespace and go back to the line the cursor was
nnoremap <silent> <leader>R :%s/\s\+$//<cr>:let @/=''<CR>:call IndentFile()<CR>

""" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"" Toggle Last used files list
nnoremap <silent> <leader>m :MRU<CR>
"" MRU Ignored files
let MRU_Exclude_Files = '.*\\Local Settings\\Temp\\.*|^.*\.(hg|git|bzr)\\.*$'
let MRU_Max_Menu_Entries = 40

"" Duplicates current line
nnoremap <leader>d Yp<CR>

"" Creates new empty buffer
nmap <C-N> :enew<CR>

"" Cycles between windows
nmap <tab> <C-W>w

"" Cycles between buffers
map <silent> <C-tab> :buffer #<CR>

"" Toggles NERDTree
"nmap <silent> <F1> <C-O>:call NTFinderP()<CR>
"imap <silent> <F1> <C-O>:call NTFinderP()<CR>
imap <silent> <F1> <esc>:NERDTreeFind<CR>
nmap <silent> <F1> :NERDTreeFind<CR>

"" List/Next/Previous buffers
map <silent> <F2> <esc>:BufExplorer<CR>
imap <silent> <F2> <C-O>:BufExplorer<CR>
map <silent> <F3> <esc>:bp<CR>
imap <silent> <F3> <C-O>:bp<CR>
map <silent> <F4> <esc>:bn<CR>
imap <silent> <F4> <C-O>:bn<CR>

"" Toggle between Wrap and no Wrap lines
map <silent> <F5> :set nowrap!<CR>
imap <silent> <F5> <C-O>:set nowrap!<CR>

"" Toggle between display line endings
map <silent> <F6> :set nolist!<CR>
imap <silent> <F6> <C-O>:set nolist!<CR>

"" Closes buffer but keep window open. Opens clear buffer
nmap <silent> <C-F4> :Bclose<CR>
imap <silent> <C-F4> <C-O>:Bclose<CR>
nmap <silent> <S-F4> :Bclose!<CR>
imap <silent> <S-F4> <C-O>:Bclose!<CR>
nmap <C-x> :Bclose<CR>
imap <C-x> <C-O>:Bclose<CR>

"" Closes current window
nnoremap <M-w> <C-w>c<esc>

"" Clear search highlight
nnoremap <leader><space> :noh<CR>

"" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"" Split vertical window and switch to it
nnoremap <leader>s <C-w>v<C-w>l
