#!/bin/sh
set -eu
PREFIX=$HOME/local
SOURCEDIR=$PREFIX/src
WORKDIR=$SOURCEDIR/vim
CORE=`nproc`
OPTIONS=`echo "--prefix=$PREFIX
--with-features=huge
--enable-gui=gnome2
--enable-fail-if-missing
--enable-perlinterp
--enable-pythoninterp
--enable-python3interp
--enable-rubyinterp
" | tr '\n' ' '`

COMMANDS="echo 'building vim...'

if [ ! -d $SOURCEDIR ]; then
  echo 'mkdir -p $SOURCEDIR'
  mkdir -p $SOURCEDIR
fi

if [ ! -d $WORKDIR ]; then
  git clone git@github.com:vim/vim.git $WORKDIR
  cd $WORKDIR
else
  cd $WORKDIR
  git pull
fi

./configure $OPTIONS
make -j$CORE
make install
echo 'done.'"

echo "$COMMANDS"
