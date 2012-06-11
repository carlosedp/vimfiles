filetype off
call pathogen#infect()

"" Use Vim settings, rather then Vi settings (much better!).
"" This must be first, because it changes other options as a side effect.
set nocompatible

set modeline
set ttyfast

"" Hides the buffer instead of closing. Allows switch unsaved buffers.
set hidden

"" No backup and swap files
set nobackup
set noswapfile

"" Loads standard MS-Windows way of CTRL-X, CTRL-C and CTRL-V
source $VIMRUNTIME/mswin.vim
behave mswin

""  Set cursor selection mode and prevent entering select mode (prefer visual mode).
set selection=exclusive
set selectmode=mouse,key,cmd

" set English language
language messages en_US
set langmenu=none

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
    set spl=en spell
    set nospell
endif

"" enable mouse
set mouse=a

" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

"" Do not return to start of line
set nostartofline

"" Disable ALT keys access to menubar. Makes mappings work.
set winaltkeys=no

set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set number " show line numbers

"" set search ignorecase
set ignorecase
set smartcase
set incsearch		" do incremental searching
set hlsearch

"" Remaps search
nnoremap / /\v
vnoremap / /\v

"" All matches in a line are substituted instead of one
set gdefault

"" Automatically change working dir to current buffer
set autochdir

"" Disable bell
set vb

"" Set GUI Options and scrollbars
set guioptions=egmrLtTb

"" Remove the 'tear bla bla from menus'
set guioptions-=t

"" set GUI font
if has("gui_macvim")
    " set macvim specific stuff
    " Remove left scrollbar
    set guioptions-=L
    " make Mac 'Option' key behave as 'Alt'
    set mmta
    set guifont=Anonymous\ Pro:h16
    "set guifont=Inconsolata:h15
    "set guifont=Droid\ Sans\ Mono:h10
    "set guifont=Consolas:h14
    "set guifont=Bitstream\ Vera\ Sans\ Mono:h14
    " MacVIM shift+arrow-keys behavior (required in .vimrc)
    let macvim_hig_shift_movement = 1
    " Keep undo history across sessions, by storing in file.
    set undodir=~/.vim/backups
    set undofile

else
    set guifont=Anonymous\ Pro:h13
    "set guifont=Inconsolata:h13.5
    "set guifont=Consolas:h11
    "set guifont=Droid\ Sans\ Mono:h10
    "set guifont=Bitstream\ Vera\ Sans\ Mono:h11
endif

"" Set initial window size only on GUI
if has("gui_running")
    "set lines=40 columns=120
    set browsedir=buffer
endif

"" encodings configure
set fileencoding=utf-8
"set encoding=latin1
set encoding=utf-8
set fileencodings=utf-8,latin1
set fileformats=unix,dos,mac

"" Set narrow linespace
set linespace=0

" Tab completion
set wildmenu "Turn on WiLd menu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*
set wildignore+=*/node_modules/*

"Set magic on, for regular expressions
set magic

" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l

"" set filetype check on
filetype plugin indent on
syntax on
set background=dark
"colorscheme ir_black
"colorscheme desert
"colorscheme molokai
"colorscheme Mustang
colorscheme solarized

""Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

""setting about indent
set autoindent
set smartindent

" No extra space when join lines
set nojoinspaces

"" Wrap text
set wrap
set showbreak=...
set linebreak
"set textwidth=79
set formatoptions=qrn1

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

"" Highlight current line and set color
set cursorline

"" Allow cursor to be positioned anywhere in block select mode
set virtualedit=block

"" Use Unix format for files
"set sessionoptions+=unix,slash,localoptions
set sessionoptions=buffers,curdir,folds,help,resize,winpos,winsize,tabpages,unix,slash,localoptions

"" Cold Folding
set foldenable
set foldmethod=syntax
set foldlevelstart=100


"" Set custom filetypes
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ejs set filetype=html.js

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType jade :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType coffee :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby,eruby :setlocal sw=2 ts=2 sts=2

"" Disable AutoClose plugin on markdown files"
autocmd FileType * :AutoCloseOn
autocmd FileType markdown :AutoCloseOff
"autocmd FileType markdown :set spell

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Resize splits when the window is resized 
au VimResized * exe "normal! \<c-w>="

"" Status line
augroup ft_statuslinecolor
    au!
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=gray
augroup END
set laststatus=2
set statusline=
set statusline+=%f\ %m\ %r
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=\ [%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]
set statusline+=\ %{WordCount()}\ words
set statusline+=\ \ %(%c:%l/%L%)\ (%p%%)

" Hightlight line if exceeds 80 columns
if exists('+colorcolumn')
  set colorcolumn=80
endif

"""""""""""""""""""""""""""""""""""""""
"""""""""""""  Functions  """""""""""""
"""""""""""""""""""""""""""""""""""""""

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

"" Indent files. Use plugin when filetype is Javascript.
function! IndentFile()
    "if &filetype == 'javascript'
        "let l = line('.')
        "let c = col('.')
        "call g:Jsbeautify()
        "call cursor(l,c)
    "else
        let l = line('.')
        let c = col('.')
        execute "normal! gg=G"
        call cursor(l,c)
    "endif
endfunction

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
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

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


"" Word count functions
let g:word_count="<unknown>"
fun! WordCount()
    return g:word_count
endfun
function! UpdateWordCount()
    let lnum = 1
    let g:word_count = 0
    while lnum <= line('$')
        let g:word_count = g:word_count + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    return g:word_count
endfunction

augroup WordCounter
    au! BufRead,BufNewFile,BufEnter,CursorHold,CursorHoldI,InsertEnter,InsertLeave * call UpdateWordCount()
augroup END

" how eager are you? (default is 4000 ms)
set updatetime=500


"" Full screen function
let g:fullscreenmode = 0
function! ToggleFullScreen()
    if g:fullscreenmode == 0
        let g:fullscreenmode = 1
        set nonumber
        set laststatus=0
        set guioptions-=mr
        set guioptions-=Tb
        if has("gui_running")
            " GUI is running or is about to start.
            " Maximize gvim window.
            set lines=999 columns=999
        else
            " This is console Vim.
            if exists("+lines")
                set lines=50
            endif
            if exists("+columns")
                set columns=100
            endif
        endif
        if has("gui_macvim")
            " Settings for WriteRoom like mode.
            set lines=50 columns=80
            set fuoptions=background:#00002b36
            hi NonText guifg=bg
            set fullscreen
        endif
        :CMiniBufExplorer
    else
        let g:fullscreenmode = 0
        set guioptions+=mr
        set guioptions+=Tb
        set laststatus=2
        set number
        if has("gui_macvim")
            set nofullscreen
        endif
        :MiniBufExplorer
        execute "normal \<c-w>w"
    endif
endfunction

"" Fix for quitting with just one window open (MiniBufExplorer bug)
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="nofile"
        " if this window is last on screen quit without warning
        if winnr('$') < 2
            quit!
        endif
    endif
endfunction

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,eruby,python,javascript,coffee,jade,sass,less,scss autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"""""""""""""""""""""""""""""""""""""""
"""""""""" Plugin Parameters """"""""""
"""""""""""""""""""""""""""""""""""""""

"" NERDTree Parameters
"" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

"" Open NERDTree in same dir
let NERDTreeChDirMode=1

"" Show hidden files by default
let NERDTreeShowHidden=1

"" Set BufTabs parameters
"let g:buftabs_only_basename=1
"let g:buftabs_in_statusline=1
"let g:buftabs_reserved_space=55
"let g:buftabs_active_highlight_group="Visual"

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1

"" MRU Configuration
let MRU_Exclude_Files = '.*\\Local Settings\\Temp\\.*|^.*\.(hg|git|bzr)\\.*$'
let MRU_Max_Menu_Entries = 40
let MRU_Max_Entries = 50

"" Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"

"" TabBar Settings
let g:Tb_MoreThanOne= 0
let g:Tb_MaxSize = 3
let g:Tb_MinSize = 1
let g:Tb_ModSelTarget = 1
let g:Tb_cTabSwitchBufs = 0
let g:Tb_UseSingleClick = 1
let g:did_tabbar_syntax_inits = 1
highlight Tb_Normal guifg=#808080 guibg=fg
highlight Tb_Changed guifg=#CD5907 guibg=fg
highlight Tb_VisibleNormal guifg=#5DC2D6 guibg=fg
highlight Tb_VisibleChanged guifg=#F1266F guibg=fg

"" MiniBufExplorer settings
autocmd BufEnter -MiniBufExplorer- stopinsert
let g:miniBufExplMaxSize = 3
let g:miniBufExplMinSize = 1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplCheckDupeBufs = 0

hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

"" Jekyll settings
if has("gui_macvim")
    let g:jekyll_path = '/Users/carlosedp/Projects/carlosedp.github.com'
else
    let g:jekyll_path = 'E:/Projects/carlosedp.github.com'
endif
let g:jekyll_post_suffix = "md"

"" Define VimBookmarking mappings
nmap <silent> bb :ToggleBookmark<CR>
nmap <silent> bn :NextBookmark<CR>
nmap <silent> bp :PreviousBookmark<CR>
imap <silent> <leader>bb <C-O>:ToggleBookmark<CR>

"" Ack configuration
au BufNewFile,BufReadPost *.js let g:ackprg="ack --ignore-dir=node_modules -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""
"""""""""""" Key Mappings """"""""""""
""""""""""""""""""""""""""""""""""""""

"" These mappings override any mapping made by plugins and are called after
"" all plugins. Be careful.
function! AfterMappings()

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    "<Ctrl-V> -- paste
    nm \\paste\\ "=@*.'xy'<CR>gPFx"_2x:echo<CR>
    imap <C-V> x<Esc>\\paste\\"_s
    vmap <C-V> "-cx<Esc>\\paste\\"_x

    "Edit mapping (make cursor keys work like in Windows: <C-Left><C-Right>
    "Move to next word.

    "These mappings are used when set selectmode= (Visual Mode).
    "nnoremap <C-Left> b
    "vnoremap <C-S-Left> <C-O>b
    "nnoremap <C-S-Left> gh<C-G>b
    "inoremap <C-S-Left> <C-\><C-O>gh<C-G>b

    "nnoremap <C-Right> e
    "vnoremap <C-S-Right> <C-O>e
    "nnoremap <C-S-Right> gh<C-G>e
    "inoremap <C-S-Right> <C-\><C-O>gh<C-G>e
    
    " These mappings are used when set selectmode=mouse,key,cmd (Select Mode).
    nnoremap <C-Left> b
    vnoremap <C-S-Left> b
    nnoremap <C-S-Left> gh<C-O>b
    inoremap <C-S-Left> <C-\><C-O>gh<C-O>b

    nnoremap <C-Right> w
    vnoremap <C-S-Right> w
    nnoremap <C-S-Right> gh<C-O>w
    inoremap <C-S-Right> <C-\><C-O>gh<C-O>w

    " Map NERDComment toggle to work on select-mode
    vmap <leader>c<space> :call NERDComment(1, 'toggle')<CR>

endfunction
"" Call mapping function
au VimEnter * :call AfterMappings()

"" Fast find selected text
map , y/<C-R>"/<cr>

"" Inserts hard tab in INSERT mode
inoremap <leader><Tab> <C-V><Tab>

"" Make enter useful in normal & visual mode (match tags and brackets)
nmap <C-CR> %
vmap <C-CR> %

"" Strip all trailing whitespace in the current file
nnoremap <silent> <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"" Do the same to all open buffers
nnoremap <silent> <leader>WW :bufdo let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"" Reindent Code, strip trailing whitespace and go back to the line the cursor was
nnoremap <silent> <leader>R :call IndentFile()<CR>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"" Do the same to all open buffers
nnoremap <silent> <leader>RR :bufdo call IndentFile()<CR>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"" Toggle Last used files list
nnoremap <silent> <leader>m :MRU<CR>

"" Edits vimrc file
if has("gui_macvim")
    map <leader>e :e ~/.vim/vimrc<CR>
else
    map <leader>e :e $VIM/vimfiles/vimrc<CR>
endif

"" Duplicates current line
nnoremap <leader>d Yp

"" Creates new empty buffer
nmap <C-N> :enew<CR>

"" Cycles between windows
nnoremap <leader><tab> <C-W>w
nnoremap <tab> <C-W>w

"" Cycles between buffers
map <silent> <C-tab> :buffer #<CR>

"" Toggles NERDTree
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
map <F5> :set nowrap!<CR> :set wrap?<CR>
imap <F5> <C-O>:set nowrap!<CR> :set wrap?<CR>

"" Toggle between display line endings
map <silent> <F6> :set nolist!<CR>
imap <silent> <F6> <C-O>:set nolist!<CR>

"" Toggle full screen mode
map <silent> <F11> :call ToggleFullScreen()<CR>

"" Closes buffer but keep window open. Opens clear buffer
nmap <silent> <C-F4> :Bclose<CR>
imap <silent> <C-F4> <C-O>:Bclose<CR>
nmap <silent> <S-F4> :Bclose!<CR>
imap <silent> <S-F4> <C-O>:Bclose!<CR>
nmap <C-x> :Bclose<CR>
imap <C-x> <C-O>:Bclose<CR>

"" Closes current window
nnoremap <M-w> <C-w>c<esc>

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

"" Split horizontal window and switch to it
nnoremap <leader>h :split<CR>

"" Taglist Toggle
map <silent> <leader>tl :TlistToggle<CR>

"" Search word under cursor
nnoremap , /<C-R><C-W><CR>N

"" Clear highlight
nnoremap <leader><space> :noh<CR>:call clearmatches()<CR>

"" Make cursor move as expected with wrapped lines (in insert mode only with Ctrl key)
nnoremap <silent> <M-Up> gk
nnoremap <silent> <M-Down> gj
inoremap <silent> <Up> <C-O>gk
inoremap <silent> <Down> <C-O>gj

"" Inserts file name without extension into text
inoremap \fn <C-R>=expand("%:t:r")<CR>

"" Changes line filetype endings
map <leader>fu :set ff=unix<CR>
map <leader>fd :set ff=dos<CR>
map <leader>fm :set ff=mac<CR>

"" Generate rtf from markdown using Pandoc
command! PR :!pandoc "%" -o "%:t:r.rtf" -t rtf -s

"" Remaps J to gJ to join lines without spaces
map J gJ

"" Replace
nnoremap <leader>r :%s//<left>

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python
nnoremap _js :set ft=javascript<CR>

"Map CMD-y to CTRL-y for redo
map <D-y> <C-y>
imap <D-y> <C-y>

" Map \g to Gundo
nnoremap <leader>g :GundoToggle<CR>
