set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set nocindent
set showmatch
set ruler

" Settings for hard textwidth.
"set textwidth=79
"set colorcolumn=+2
"let &colorcolumn="80,".join(range(80, 999),",")

" Setting for soft textwidth.
"set colorcolumn=80  " show vertical line at column of 80.

" let python_version_2 = 1 
let python_highlight_all = 1 

" Syntastic settings
let g:syntastic_python_checkers = ['python', 'flake8']

" autopep8 settings
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=4
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E901,E128"

" jedi-vim settings
  " mappings
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_command = "<leader>d"
let g:jedi#documentation_command = "D"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0   " If 1, show too many functions.. 

noremap <buffer> <F8> :call Autopep8()<CR>

"colorscheme gruvbox
"colorscheme Monokai
"colorscheme jelleybeans
"colorscheme monokai-chris
"colorscheme monokai-phoenix
