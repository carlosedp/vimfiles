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

"" Do not show mode on command line
set noshowmode

"" Set timeoutlen
set ttimeoutlen=50

"" Set GUI Options and scrollbars
set guioptions=egmrLtTb

"" Remove the 'tear bla bla from menus'
set guioptions-=t

" Keep undo history across sessions, by storing in file.
set undodir=~/.vimundo
set undofile

if has("gui_macvim")
    " set macvim specific stuff
    " Remove left scrollbar
    set guioptions-=L
    " make Mac 'Option' key behave as 'Alt'
    set mmta
    " Set Mac font
    set guifont=Inconsolata_for_Powerline:h16
    " MacVIM shift+arrow-keys behavior (required in .vimrc)
    let macvim_hig_shift_movement = 1
else
    " Set windows font
    set guifont=Inconsolata_for_Powerline:h13.5
endif

"" Set initial window size only on GUI
if has("gui_running")
    set browsedir=buffer
endif

"" encodings configure
set fileencoding=utf-8
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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"Set magic on, for regular expressions
set magic

" Backspace and cursor keys wrap to previous/next line
set backspace=2
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l

"" set filetype check on
filetype plugin indent on
syntax on

"" Set colorschemes
set background=dark
colorscheme Tomorrow-Night

""Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

"" setting about indent
set autoindent
set smartindent

"" set tabstop value and shift width
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"" Define custom indentation for filetypes
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType jade :setlocal sw=2 ts=2 sts=2
autocmd FileType less :setlocal sw=2 ts=2 sts=2
autocmd FileType coffee :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby,eruby :setlocal sw=2 ts=2 sts=2

" No extra space when join lines
set nojoinspaces

"" Wrap text
set wrap
set showbreak=...
set linebreak
"set textwidth=79
set formatoptions=qrn1

" Display invisible characters.
if has("multi_byte")
    set listchars=eol:$,tab:>-,extends:›,precedes:‹,trail:·,nbsp:✂
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
else
    set listchars=tab:>-,extends:>,precedes:<,trail:-,nbsp:%
    endif
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
set sessionoptions=buffers,curdir,folds,help,resize,winpos,winsize,tabpages,unix,slash,localoptions

"" Cold Folding
set foldenable
set foldmethod=syntax
set foldlevelstart=100

"" Set custom filetypes
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ejs set filetype=html.js
autocmd! BufRead,BufNewFile *.fountain	 set filetype=fountain

"" Disable AutoClose plugin on markdown files"
"let g:AutoCloseProtectedRegions = []
"autocmd FileType * :AutoCloseOn
"autocmd FileType markdown :AutoCloseOff
"autocmd FileType markdown :set spell

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"" Status line
augroup ft_statuslinecolor
    au!
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=59 guifg=#4d5057
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
let g:colorcol = 80
if exists('+colorcolumn')
  let &colorcolumn=g:colorcol
endif

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

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
        "if !(filereadable(b:sessionfile))
            ":call MakeSession()
        "endif
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
set updatetime=300


"" Full screen function
let g:fullscreenmode = 0
function! ToggleFullScreen()
    if g:fullscreenmode == 0
        let g:fullscreenmode = 1
        if exists('+colorcolumn')
            set colorcolumn=
        endif
        let g:oldColumns = &columns
        let g:oldLines = &lines
        set nonumber
        set laststatus=0
        set rulerformat=%40(%{WordCount()}\ words%=%(%c:%l/%L%)\ (%p%%)%)
        set linespace=3
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
            set lines=999 columns=80
            set fuoptions=background:Normal
            hi NonText guifg=bg
            set fullscreen
        else
            set numberwidth=10
            set foldcolumn=12
            hi FoldColumn ctermbg=none
            hi LineNr ctermfg=0 ctermbg=none
            hi NonText ctermfg=0
        endif
        :MBEClose
    else
        let g:fullscreenmode = 0
        set linespace=0
        set guioptions+=mr
        set guioptions+=Tb
        set laststatus=2
        set number
        if has("gui_macvim")
            set nofullscreen
        else
            set numberwidth=4
            set foldcolumn=0
            execute 'colorscheme ' . g:colors_name
        endif
        let &columns=g:oldColumns
        let &lines=g:oldLines
        if exists('+colorcolumn')
            let &colorcolumn=g:colorcol
        endif
        :MBEOpen
        "execute "normal \<c-w>w"
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

"" Clear trailing whitespaces on save for some filetypes
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,eruby,python,javascript,coffee autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

fun! XMLPretty()
    set ft=xml
    %s/\v\>\</>\r<
    call IndentFile()
    call <SID>StripTrailingWhitespaces()
endfun
command! XMLPretty :call XMLPretty()

"""""""""""""""""""""""""""""""""""""""
"""""""""" Plugin Parameters """"""""""
"""""""""""""""""""""""""""""""""""""""

"" NERDTree Parameters
    " Quit on opening files from the tree
    let NERDTreeQuitOnOpen=1
    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline=1
    " Open NERDTree in same dir
    let NERDTreeChDirMode=1
    " Show hidden files by default
    let NERDTreeShowHidden=1

"" Taglist configuration
    let Tlist_Use_Right_Window = 1
    let Tlist_Auto_Highlight_Tag = 1
    let Tlist_GainFocus_On_ToggleOpen = 1
    let Tlist_Show_One_File = 1
    let Tlist_Sort_Type = "name"

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
    let g:miniBufExplBuffersNeeded = 0
    let g:miniBufExplAutoStart = 1

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

"" Indent Guides
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1

"" Neocomplete
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    let g:neocomplete#enable_insert_char_pre = 1

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"" Neosnippet
    " Disable select mode mappings. Problems with indentation
    let g:neosnippet#disable_select_mode_mappings=0

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    if has("gui_macvim")
        let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
    else
        let g:neosnippet#snippets_directory='$VIM/vimfiles/bundle/vim-snippets/snippets'
    endif

"" Airline statusbar
    let g:airline_powerline_fonts = 1
    let g:airline_section_x = "%{strlen(&filetype)>0?&filetype:''} [%{WordCount()} words]"

"" vimerl
    let g:erlangHighlightErrors = 1
    let g:erlangHighlightBif = 1
    let g:erlangCompletionDisplayDoc = 1
    let g:erlangRefactoring = 1

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

    "These mappings are used when set selectmode=mouse,key,cmd (Select Mode).
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

    " Alternate between last use buffers
    nnoremap <C-Tab> :b#<CR>
    inoremap <C-Tab> <C-O>:b#<CR>
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
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>

"" Edits vimrc file
if has("gui_macvim")
    map <leader>e :e ~/.vim/vimrc<CR>
else
    map <leader>e :e $VIM/vimfiles/vimrc<CR>
endif

"" Duplicates current line or selected lines
nnoremap <leader>d Yp
snoremap <leader>d <C-O>Yp

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
imap <F5> <C-O>:set nowrap!<CR>

"" Toggle between display line endings
map <silent> <F6> :set nolist!<CR>
imap <silent> <F6> <C-O>:set nolist!<CR>

"" Toggle full screen mode
map <silent> <F11> :call ToggleFullScreen()<CR>

"" Closes buffer but keep window open. Opens clear buffer
nnoremap <silent> <C-w> :Bclose<CR>
nnoremap <silent> <C-x> :Bclose<CR>
inoremap <silent> <C-w> <C-O>:Bclose<CR>
inoremap <silent> <C-x> <C-O>:Bclose<CR>
inoremap <silent> <C-F4> <nop>
nnoremap <silent> <C-F4> <nop>
nnoremap <silent> <S-F4> :Bclose!<CR>
inoremap <silent> <S-F4> <C-O>:Bclose!<CR>

"" Closes current window
nnoremap <M-w> <C-w>c<esc>

"" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Bubble lines up and down
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

"" Split vertical window and switch to it
nnoremap <leader>s <C-w>v<C-w>l

"" Split horizontal window and switch to it
nnoremap <leader>h :split<CR>

"" Taglist Toggle
map <silent> <leader>tl :TlistToggle<CR>

"" Search word under cursor
nnoremap , /<C-R><C-W><CR>N

"" Clear highlight
nnoremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

"" Make cursor move as expected with wrapped lines (in insert mode only with Ctrl key)
"inoremap <silent> <Up> <C-O>gk
"inoremap <silent> <Down> <C-O>gj

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
nnoremap <leader>r :%s/\v/<left>

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _py :set ft=python<CR>
nnoremap _js :set ft=javascript<CR>

" Map CMD-y to CTRL-y for redo
map <D-y> <C-y>
imap <D-y> <C-y>

" Map \g to Gundo
nnoremap <leader>g :GundoToggle<CR>

" Surround selection with following char
smap <leader>a <C-g>S

" Easy change spell language
nnoremap _pt :set spell spelllang=pt<CR>
nnoremap _en :set spell spelllang=en<CR>

