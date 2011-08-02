Vim
===


It is recommended that you use gVim in either Windows or Linux and MacVim for
Mac. Download from:

* (Windows) http://www.vim.org/download.php#pc (gvim72.exe)
* (Mac) http://code.google.com/p/macvim/downloads/list (snapshot-52)

Usage
-----

Troubleshoot: Because of the large amount of submodules, if you ever have any
trouble after pulling from the repository, it will be easier to just back up 
your old .vim folder and just git clone a new version.

Clone this repo into your home directory either as `.vim` (linux/mac) or 
`vimfiles` (Windows). Such as:

    git clone git://github.com/carlosedp/vimfiles.git ~/.vim

Then `cd` into the repo and run this to get the snippets submodule:

    git submodule init
    git submodule update

Now just copy (or symlink) the `.vim/vimrc` file as `.vimrc` (Mac/Linux)
or copy as `_vimrc` (Windows) in your home directory. In Mac and Linux, the 
easiest thing to do is:

    ln -s ~/.vim/vimrc ~/.vimrc

On windows, create an environment var `gVim` pointing to the install dir and put
the _vimrc file in this dir. Clone the vimfiles repo into the same place like:

c:/apps/vim/_vimrc
           /vim72/...
           /vimfiles/...

If you already have a custom `.vimrc` file, append the following lines to
load everything else along with your personal hacks:

    source ~/.vim/vimrc      "linux
    source ~/vimfiles/vimrc  "windows

To update all submodules, use the following command on vimfiles dir:

    git submodule foreach git pull origin master

Dependencies
------------

You will need these dependencies figured out:

* Exuberant Ctags (http://ctags.sourceforge.net/)

In Ubuntu, for example, you will have to do:
    `apt-get install exuberant-ctags ncurses-term`

In OS X, you can install ctags with homebrew
    `brew install ctags`

On Windows you have to download Ctags and add ctags.exe in your PATH.

Mac OS X and most Linux distros come with Ruby already. If you're in Windows
look for Luis Lavena's latest Ruby Installer (http://rubyforge.org/projects/rubyinstaller/)

* Ack

You can download Ack standalone from http://betterthangrep.com/ using their own instructions:
    `curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3`

On Windows, download the ack-standalone, and perl(git already ships with it) than, create a `ack.cmd` on Windows path with the following content: `@"C:\Program Files\Git\bin\perl" C:\dev\ack-standalone.pl %*` adjusting the paths for your needs.

Learn Vim
---------

Visit the following sites to learn more about Vim:

* http://vimcasts.org

There are many sites teaching Vim, if you know of any other that are easy
to follow for newcomers, let me know.

Credits
-------

* Original project and most of the heavy lifting: @scrooloose
* All the cool plugins for Rails, Cucumber and more: @timpope
* Hacks and some snippets: @carlosedp
