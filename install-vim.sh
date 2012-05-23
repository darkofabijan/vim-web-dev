#!/bin/bash

sudo apt-get install -y mercurial

cd /tmp
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --enable-rubyinterp --enable-gui=no
make
sudo make install
cd /tmp
sudo rm -rf vim
