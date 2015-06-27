#!/bin/bash
ln -s -bi $PWD/vimrc ~/.vimrc

ln -sbi $PWD/xmonad.hs ~/.xmonad/xmonad.hs
ln -sbi $PWD/xmobarrc ~/.xmobarrc
ln -sbi $PWD/profile ~/.profile
ln -sbi $PWD/Xresources ~/.Xresources


sudo ln -sbi $PWD/hosts /etc/hosts
