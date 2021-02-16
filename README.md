 .vim
 ----

  VIM configuration.

  Prerequisites
  -------------
  - Putty font configuration
    - Window -> Appearance -> Font settings, font: **Consolas**, style: **normal**.

  - ctags (Recommendation)
    - To install ctags:
      - Mac:
        ``` 
        $brew install ctags
        ```
      - Ubuntu: 
        ```
        $sudo apt-get install ctags 
        ```

  VIM Installation
  ----------------
  ```
  <!-- git clone --recurse-submodules https://gitlab.com/unist_ssl/vim.git -->
  git clone --recurse-submodules git@gitlab.com:ulis-in-unist/vim.git
  source ~/vim/setup.sh
  ```

  ctags
  -----
  - A programming tool that generates a tag file of names found in source and header files
    which allows definitions to be quickly.
  - Settings:
    ```
    project root directory$ ctags -R .
    ```
    - In settings.vim or after/ftplugin/[filetype].vim
      ```vim
      set tags=${project PATH}/tags 
      ```

  - Basic Usage:
    - Go to definition: **F9**
    - Go back to the code: **F10**
  - Advanced Usage:
    - References: https://harryp.tistory.com/130 
  - **Caution**: If 'tags not found' error message is shown, please generate tags file again.

  Default Settings
  ----------------
  - Show line number
    - Toggle Mapping Key: **F3**
 
  - Enable to do **mouse-scroll** in **normal** mode while **copy & paste using the mouse** are allowed in **insert** mode.

  Tmux Settings
  -------------
  - Colorscheme for vim doesn't break.

  File Type Settings
  ------------------
  - You can set customized vim settings for specific programing language (or filetype).
  - Set your customized vim settings to [filetype].vim (e.g, python.vim, c.vim, java.vim)
  - Put [filetype].vim to ~/.vim/after/ftplugin/ 

  Plugins
  -------
  - **vim-colorschemes** (**default**)
    - The colorschemes for vim editor.
    - References: https://github.com/flazz/vim-colorschemes
    - USAGE: colorscheme [colorscheme name] (e.g, molokai, jellybeans, wombat) 
    - If you want to apply colorscheme to specific file type,
      put 'colorscheme [name]' to ~/.vim/after/ftplugin/[filetype].vim
    - Usage example:
        - In ~/.vim/after/ftplugin/c.vim, 
          ```vim
          colorscheme gruvbox 
          ```
#

  - **NERDTree** (**default**, Make vim slow)
    - A file and directory tree for vi editor.
    - References: https://github.com/scrooloose/nerdtree
    - How to use: https://medium.com/usevim/nerd-tree-guide-bb22c803dcd2
    - Toggle Mapping Key: **F1**
    - Open the selected file in a horizontal/vertical split window: **i** / **s**
    - Move cursor to splited window: **Ctrl + w** or **mouse click**
    - Open the selected file in a new tab: **t** or mouse **double-click**.
    - Command for buffer in tab (command mode)
      - Move next(right) buffer: :bn
      - Move prev(left) buffer: :bp
      - Delete current buffer: :bd
    - Window size can be adjusted with mouse drag.
#

  - **tagbar**
    - A plugin that provides an easy way to get an overview of its code structure.
      You can see defined struct, variables, functions, and navigate it to the code.
    - References: https://github.com/majutsushi/tagbar
    - Prerequisite: ctags
    - Toggle Mapping Key: **F2**
    - Move the window: **Ctrl + ww** or **mouse click**
    - Window size can be adjusted with mouse drag.
#

  - **NeoComplete** (**default**)
    - A plugins for auto completion.
    - References: https://github.com/Shougo/neocomplete.vim
    - Press **TAB** to select auto completion candidates.
#

  - **ctrlp.vim**
    - A plugin for searching files and directories in vi editor window.
    - References: https://github.com/kien/ctrlp.vim
    - Limitation: only searching files and directories in the current path.
    - Mapping Key: **Ctrl + p**
#

  - **grep.vim**
    - A plugin for using grep command in vi editor window.
    - Mapping Key: **F4**
    - Commands
      - Quickfix list open: :copen 
      - Move next file in Quickfix list: :cnext (cn) 
      - Move prev file in Quickfix list: :cprev (cp) 
#

  - **vim-smooth-scroll** (**default**)
    - Mapping Key: 
      - UP: **Ctrl + u** or **Ctrl + f**
      - DOWN: **Ctrl + d** or **Ctrl + b**
#

  - **Syntastic** (Make vim slow)
    - A plugin for checking syntax error.
    - References: https://github.com/vim-syntastic/syntastic
    - Load change: **F5**
    - Disable to check syntax: **F7** 
    - Enable to check syntax again: **F6**
    - Move syntastic window: **Ctrl + ww** or **mouse click**
    - To be able to check when open: In plugins.vim,
      ```vim
      let g:syntastic_check_on_open = 1
      ```
#

  - **indentLine** (**default**)
    - Toggle: Ctrl + i
    - To disable: In plugins.vim,
      ```vim
      let g:indentLine_enabled = 0
      ```
#

  - **Ultisnips, vim-snippets**
    - A plugin for auto completion of code snippets.
    - References: https://github.com/SirVer/ultisnips
    - How to know snippets:
      - See .vim/bundle/vim-snippets/snippets/
        - C / C++ : c.snippets, cpp.snippets
        - python: python.snippets
    - Command
      - Expand snippets-autocomplete trigger: \e

  Plugins for python
  ------------------
  - **jedi-vim**
    - references: https://github.com/davidhalter/jedi-vim
    - Commands
      - Go to definition: \d
      - Go to assignement: \a
      - Documentation: D
      - Variable rename: \r
      - See variable usage: \u
      - Open python module: :Pyimport [module] (e.g, os, sys)
      - Help jedi-vim: :help jedi-vim
#

  - **vim-autopep8**
    - A plugin for following pep8 guidelines automatically.
    - References: https://github.com/tell-k/vim-autopep8
    - required: autopep8
    - Mapping Key: **F8**

  How to update plugin
  ---------------------
  - Addition
    - In plugins.vim, add plugin and some following settings.   
      Also, you can use the commented plugins (e.g, syntastic).
  - Deletition
    - In plugins.vim, comment plugin.
  - To update:
    ```
    ~/.vim$ source update.sh
    ```

  Settings for python
  -------------------
  To set up (Recommend to install in python virtual env):
  ```
  (venv) pip install pep8 pyflakes autopep8
  ```
  - pep8, pyflakes
    - A python package for notifying pep8 error, warning.
  - autopep8
    - prerequisite of vim-autopep8 

  References
  ----------
  - https://github.com/gyeongchan-yun/.vim
