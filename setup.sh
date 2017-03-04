#!/bin/bash -e

link_file(){
  source_root=$1
  dest_root=$2
  file_name=$3
  ln -vs $(pwd)/$source_root/$file_name $dest_root/$file_name || true
}

install_vim_config() {
  root=$(dirname "$0")/vim
  files=$(find $root -type f | sed -n 's|^'"$root"'/||p')
  for file in $files; do
    mkdir -p ~/.vim/$(dirname $file)
    link_file $root ~/.vim $file
  done
}

install_vim_config
ln -vs $(pwd)/$(dirname $0)/vimrc ~/.vimrc

