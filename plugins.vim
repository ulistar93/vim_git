" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"*********************************
"* Plugin install packages       
"*********************************

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Raimondi/delimitMate'        " Auto complete bracket in code.
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'
Plugin 'editorconfig/editorconfig-vim'

"** syntax check **
"Plugin 'Syntastic'

"** search **
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/grep.vim'

"** code snippets **
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

"** for python **
"Plugin 'davidhalter/jedi-vim'
"Plugin 'tell-k/vim-autopep8'

if executable('ctags')
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-easytags'          " Requirement: vim-misc
  Plugin 'majutsushi/tagbar'           " Requirement: ctags
endif

call vundle#end()

" polyglot settings
let g:polyglot_disabled = ['python']  " Default highlight on python is better
let python_highlight_all = 1

" vim-easytag settings
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_dynamic_files = 1  " If no tags for current project, load global tags at first.

" UltiSnips settings
let g:UltiSnipsExpandTrigger = "<leader>e"
let g:UltiSnipsJumpForwardTrigger = "<leader>f"
let g:UltiSnipsJumpBackwardTrigger = "<leader>b"
let g:UltiSnipsEditSplit = "vertical"

" indentLine settings
" references: https://github.com/Yggdroot/indentLine/blob/master/doc/indentLine.txt
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_fileTypeInclude = ['c', 'cpp', 'python', 'sh', 'html', 'css', 'javascript', 'xml']
let g:indentLine_fileTypeExclude = ['vim', 'markdown', 'text']  " Default is [].
nmap <C-i> :IndentLinesToggle<CR>

" tagbar settings
" references: https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_map_help = "<leader>h"

" delimitmate settings
let delimitMate_expand_cr=1

" grep.vim settings
nnoremap <silent> <F4> :Rgrep<CR>
let Grep_Default_Options = '-rnw'
"let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" ctrlp.vim settings
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1

" NERDTree settings
map <F1> :NERDTreeToggle<cr>
let NERDTreeWinSize=20
"autocmd vimenter * NERDTree  " Open NERDTree when vim enters.
"autocmd VimEnter * wincmd p  " Put cursor on vim window.
" Close NERDTree when vim window exits.
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1 " Buffer list on top
let g:airline#extensions#tabline#fnamemod = ':t'

" Syntastic settings
	" Recommended settings (conflict with vim-airline)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
  " Customized settings
" let g:syntastic_mode="passive"
let g:syntastic_loc_list_height = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
nnoremap <F5> :w<CR>
nnoremap <F6> :SyntasticCheck<CR>
nnoremap <F7> :SyntasticToggleMode<CR> 

" vim-smooth-scroll settings
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>

" Neocomplcache settings
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 2
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 5 
let g:neocomplcache_min_keyword_length = 5
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" To ignore tags file cache
let g:neocomplcache_tags_caching_limit_file_size = 0
" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>close_popup_and_complete()<CR>
function! s:close_popup_and_complete()
  " To prevent new line after typing enter key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType cpp setlocal omnifunc=cppcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplcache_force_omni_patterns')
""  let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
