#!bin/bash

if [ -f ~/.vimrc ]; then
	echo "[WARNING] .vimrc already exists."
	mv ~/.vimrc ~/.vimrc_temp
	echo "[INFO] Rename .vimrc to .vimrc_temp"
fi

if [ -d ~/.vim ]; then
    echo "[WARNING] .vim/ already exists."
    mv ~/.vim ~/.vim_temp
    echo "[INFO] Rename .vim/ to .vim_temp/"
fi

mv ~/vim ~/.vim
echo "[INFO] Change vim/ to .vim/"

echo "[INFO] Colorterm of terminal and tmux should be same."
if [ -f ~/.tmux.conf ]; then
  tmux_term=`cat ~/.tmux.conf | grep 'default-terminal'`
  if [[ -z $tmux_term ]]; then   
    echo set -g default-terminal $TERM >> ~/.tmux.conf
    tmux source ~/.tmux.conf
  else  
    echo "[INFO] Already colorterm is registered in .tmux.conf."
  fi
else
  echo set -g default-terminal $TERM > ~/.tmux.conf
  tmux source ~/.tmux.conf
fi

if [ -f ~/.bashrc ]; then
  tmux_alias=`cat ~/.bashrc | grep 'alias tmux='`
  if [[ -z $tmux_alias ]]; then
    echo "[INFO] Configuration of alias for tmux in bashrc"
    echo alias tmux=\'tmux -2u\' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "[INFO] Already alias for tmux is registered in bashrc."
  fi
fi

vim +PluginInstall +qall
echo "[INFO] Plugin install is done."

echo "[INFO] VIM setup done."
