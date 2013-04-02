Jon-Michael Deldin's Dotfiles
=============================

These are my personal configuration files. Feel free to pilfer.

Installation
------------

Using [GNU Stow](http://www.gnu.org/software/stow/):

    $ git clone git://github.com/jmdeldin/dotfiles.git ~/etc
    $ stow -S etc -t $HOME -v --ignore='README.md'

Uninstallation
--------------

    $ stow -D etc -t $HOME -v
