#!/bin/sh
set -eu
PREFIX=$HOME/local
WORKDIR=$PREFIX/src/vim

COMMANDS="echo 'building vim...'
cd $WORKDIR
git pull
./configure --prefix=$PREFIX --with-features=huge --enable-gui=gnome2 --enable-fail-if-missing --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp
make -j8
make install
echo 'done.'"

echo "$COMMANDS"
