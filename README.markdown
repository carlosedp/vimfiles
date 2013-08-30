Vim
===


It is recommended that you use gVim in either Windows or Linux and MacVim for Mac. You need version 7.3.885
or newer because there are dependencies.

Download from:

Windows:
[http://files.kaoriya.net/goto/vim73w32](http://files.kaoriya.net/goto/vim73w32) (32bit)
[http://files.kaoriya.net/goto/vim73w64](http://files.kaoriya.net/goto/vim73w64) (64bit)

Ps. I needed to "flat-out" the structure of the downloaded zip above. There is
a vim73 dir inside it that I needed to move the files to the install root.

Mac:
In MacVim with homebrew:

    brew install macvim --with-cscope --with-lua --override-system-vim

Usage
-----

Troubleshoot: Because of the large amount of submodules, if you ever have any
trouble after pulling from the repository, it will be easier to just back up 
your old .vim folder and just git clone a new version.

Clone this repo into your home directory either as `.vim` (linux/mac) or 
`vimfiles` (Windows). Such as:

    git clone git://github.com/carlosedp/vimfiles.git ~/.vim

Then `cd` into the repo and run this to get the submodules:

    git submodule init
    git submodule update

Now just copy (or symlink) the `.vim/vimrc` file as `.vimrc` (Mac/Linux)
or copy as `_vimrc` (Windows) in your home directory. In Mac and Linux, the 
easiest thing to do is:

    ln -s ~/.vim/vimrc ~/.vimrc

On windows, create an environment var `VIM` pointing to the install dir and put
the` _vimrc` file in this dir. Clone the vimfiles repo into the same place like:

    c:/apps/vim/_vimrc
               /vim73/...
               /vimfiles/...

If you already have a custom `.vimrc` file, append the following lines to
load everything else along with your personal hacks:

    source $VIM/vimfiles/vimrc  "windows

To update all submodules, use the following command on vimfiles dir:

    git submodule foreach git pull origin master


If you are using MacVim on MacOS Lion, disable the native fullscreen mode to allow "WriteRoom" mode:

    defaults write org.vim.MacVim MMNativeFullScreen

Don't forget to install the font you plan to use from the `Fonts` dir. You can check the one that is enabled(uncommented) on the `set guifont` setting in the `vimrc` file.

Dependencies
------------

You will need these dependencies figured out:

* Exuberant Ctags [http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

In Ubuntu, for example, you will have to do:
    `apt-get install exuberant-ctags ncurses-term`

In OS X, you can install ctags with homebrew
    `brew install ctags`

On Windows you have to download Ctags and add ctags.exe in your PATH.

Mac OS X and most Linux distros come with Ruby already. If you're in Windows
look for Luis Lavena's latest Ruby Installer on [http://rubyforge.org/projects/rubyinstaller/](http://rubyforge.org/projects/rubyinstaller/)

* Ack

You can download Ack standalone from http://betterthangrep.com/ using their own instructions:
    `curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3`

On Windows, download the ack-standalone, and perl(git already ships with it) than, create a `ack.cmd` on Windows path with the following content: `@"C:\Program Files\Git\bin\perl" C:\dev\ack-standalone.pl %*` adjusting the paths for your needs.

* Pandoc

Pandoc is used to transform Markdown files into another document types. I use to generate RTF versions of Markdown text.

You can download Pandoc from [http://johnmacfarlane.net/pandoc/](http://johnmacfarlane.net/pandoc/) and install into your platform path.

My personal mappings
--------------------

    F1              -   Opens NERDTree in current buffer directory or Rails project root
    F2              -   Opens Buffer list
    F3              -   Previous Buffer
    F4              -   Next Buffer

    F5              -   Toggle between wrap and nowrap lines
    F6              -   Toggle between display special characters (line endings, tabs)

    F11             -   No-distraction mode writeroom mode (fullscreen)

    Ctrl+W/Ctrl-X   -   Close current file
    Shift+F4        -   Close current file without saving
    Ctrl+Q          -   Visual Mode (Replaces <C-V>)

    <leader><tab>   -   Rotate thru windows
    <leader><tab>   -   In insert mode, inserts a hard tab (\t)
    <leader>R       -   Reindent file and strips trailing whitespaces
    <leader>RR      -   Reindent file and strips trailing whitespaces on all buffers
    <leader>W       -   Strip spaces from the end of lines (entire file)
    <leader>WW      -   Strip spaces from the end of lines (entire file) on all buffers
    <leader>mm      -   Remove windows to unix "^M" artifacts
    <leader>m       -   Opens Most Recently Used file list
    <leader>c<space>-   Toggles block comment/uncomment
    <leader>d       -   Duplicates current line
    <leader>r       -   Search and replace in entire file (:%s//)
    <leader>s       -   Split window vertically and switch to it
    <leader>h       -   Split window horizontally and switch to it
    <leader>e       -   Edits vimrc file
    <leader>tl      -   Opens Taglist-plus tag browser
    <leader>fn      -   Inserts current file name into text
    <leader>fu      -   Converts filetype endings to unix
    <leader>fd      -   Converts filetype endings to dos
    <leader>fm      -   Converts filetype endings to mac
    <leader>pr      -   Executes pandoc generating an RTF from current file
    <leader>1-9     -   Applies highlight to current word
    <leader>0       -   Removes highlight from current word
    <leader>-       -   Removes all highlight
    <leader>+       -   Restores previous highlight
    <leader>space   -   Clear search highlight
    <leader>g       -   Opens Gundo plugin
    <leader>a       -   On SelectMode allows surrounding selection with following char

    Ctrl+n          -   Create new empty buffer
    Ctrl+C          -   Copy
    Ctrl+V          -   Paste
    Ctrl+X          -   Cut
    Ctrl+S          -   Save file
    Ctrl+Z          -   Undo
    Ctrl+Y          -   Redo
    Ctrl+A          -   Select all
    Ctrl+P          -   Opens CommandP fuzzy file finder
    Ctrl+Tab        -   Cycle thru buffers
    Tab             -   Autocomplete / Add snippet
    Alt+w           -   Close window
    ,               -   Quick search current word under cursor
    Ctrl+[hjkl]     -   Navigates thru split windows (left, down, up, right)

    Ctrl+up         -   Move current line up(Also works with selection)
    Ctrl+down       -   Move current line down(Also works with selection)
    Shift+J         -   Joins selected lines without spaces

    bb              -   Set line bookmark(Normal mode)
    <leader>bb      -   Set line bookmark(Insert mode)
    bp              -   Go to previous line bookmark
    bn              -   Go to next line bookmark

    za              -   Toggle folding

    >               -   Indent selected text or selection
    <               -   Dedent selected text or selection

    _md             -   Set filetype as Markdown
    _py             -   Set filetype as Python
    _js             -   Set filetype as Javascript
    call XMLPretty()  -  Set filetype to XML, break into lines and reindent file.

Learn Vim
---------

Visit the following sites to learn more about Vim:

* http://vimcasts.org

There are many sites teaching Vim, if you know of any other that are easy
to follow for newcomers, let me know.

Credits
-------

* Original project and most of the heavy lifting: @scrooloose
* The cool plugins for Rails, Cucumber and more: @timpope
* All the other modules I use that can be seen on .gitmodules or bundle dir
* Hacks and some snippets: @carlosedp
