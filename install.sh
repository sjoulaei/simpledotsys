#!/bin/bash

. "bin/common.sh"


sudo yum install -y epel-release git tmux vim
pwd=$(pwd)
ln -vsf $pwd/vim/vimrc.symlink ~/.vimrc
ln -vsf $pwd/vim/.vim ~/.vim
ln -vsf $pwd/bash/bashrc.symlink ~/.bashrc
ln -vsf $pwd/tmux/tmux.conf.symlink ~/.tmux.conf
ln -vsf $pwd/git/gitconfig.symlink ~/.gitconfig
