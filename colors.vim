set t_Co=256
set t_ut=""  " disable VIM's background color erase(bce) options -> This problem happens in tmux

hi Comment ctermfg=LightBlue

let colorscheme_bundle=expand('~/.vim/bundle/vim-colorschemes/colors/molokai.vim')
if filereadable(colorscheme_bundle)
  colorscheme molokai
endif
