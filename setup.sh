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

# Install vim config
install_vim_config
ln -vs $(pwd)/$(dirname $0)/vimrc ~/.vimrc || true
echo ----- Installing Vim Plugins -----
vim -c ":PlugInstall | qa"

# Install YCM config
ln -vs $(pwd)/$(dirname $0)/ycm_conf.py ~/.ycm_conf.py || true

#echo ----- Building YouCompleteMe -----
(
  cd ~/.vim/plugged/YouCompleteMe;
  python install.py
)

# Install tmux config
ln -vs $(pwd)/$(dirname $0)/.tmux.conf ~/.tmux.conf | true
