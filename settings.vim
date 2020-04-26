syntax on

set shiftwidth=2 " automatically shift
set softtabstop=2
set tabstop=2 
set expandtab " use space instead of tap
set title

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

"set paste " DEPRECATE -> affect other vim plugin settings 
set number
" line number toggle
nmap <F3> :set number!<CR>

" No backup and swap file
set nowritebackup
set noswapfile

set encoding=utf-8
" set fileencodings=utf-8

" Enable mouse scroll without cursor positioning
" while copy & paste using mouse are allowed in only insert mode.
" references: http://vimdoc.sourceforge.net/htmldoc/options.html
" The mouse can be enabled for different modes:
"     n   Normal mode
"     v   Visual mode
"     i   Insert mode
"     c   Command-line mode
"     h   all previous modes when editing a help file
"     a   all previous modes
"     r   for |hit-enter| and |more-prompt| prompt
set mouse=nvch
set ttymouse=xterm2  " Use mouse in tmux

" To remove preview window default option from completeopt.
set completeopt-=preview

" To trim white space. 't' denotes 'trim'
nmap <leader>t :%s/\s\+$//e <CR>

" Remember last cursor poisition
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Abbreviations that igores capital command typo
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" ctags
set tags=
map <F9> <C-]>
map <F10> <C-t>
