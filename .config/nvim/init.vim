call plug#begin('~/.config/nvim/plug')

" Languages
Plug 'cespare/vim-toml'
Plug 'othree/html5.vim'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ElmCast/elm-vim'

" Beauty
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'

" Utils
Plug 'Chiel92/vim-autoformat'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'        " ctags explorer
Plug 'tpope/vim-repeat'         " Remap . for plugins
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
" Plug 'scrooloose/nerdtree'

" Fuzzy file finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" CtrlP matcher (enhancer)
" Execute manually: PY3=ON ./install.sh
" Requires packages:
" ag, the_silver_searcher, python-neovim
" https://github.com/nixprime/cpsm
" Plug 'nixprime/cpsm', { 'do': './install.sh' }

" Function navigator for ctrlp
" https://github.com/tacahiroy/ctrlp-funky
Plug 'tacahiroy/ctrlp-funky'

" I DONT KNOW WHAT THIS DOES BUT VIM.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Youcompleteme blahblahblah
" for some reason you need to do this => python2 ./install.py --omnisharp-completer
" Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --omnisharp-completer' }

" Typescript features.
" Plug 'Quramy/tsuquyomi'

" Language server.
" https://github.com/autozimu/LanguageClient-neovim
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'junegunn/fzf'
" Plug 'roxma/nvim-completion-manager'
" Plug 'Shougo/echodoc.vim'

call plug#end()

set t_Co=256            " set 256 color
colorscheme gruvbox     " define syntax color scheme
set background=dark     " adjust vim for dark colors
set cursorline          " show current cursor line
set cursorcolumn        " show current cursor column
set number              " show line numbers
set clipboard+=unnamedplus " yank and copy to X clipboard
set shortmess+=I        " disable the welcome screen
let mapleader = ","     " map leader to ,
set backspace=2         " full backspacing capabilities
set hidden              " enable buffer switching without saving
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set scrolloff=3         " keep 2 lines spacing between cursor and edge
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set list                " show invis characters (out of place chars?)
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
set mouse=a             " mouse support

" Enable Rainbow.
let g:rainbow_active = 1
autocmd VimEnter * RainbowToggle

" Turn off search highlight.
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <F9> :bp<CR>
nnoremap <F10> :bn<CR>
nnoremap <F12> :bd<CR>

" Don't create a swap file.
set noswapfile

" Explicitly set filetype for .comp files.
" Required until https://github.com/tikhomirov/vim-glsl/pull/10 is merged
autocmd BufRead,BufNewFile *.comp set filetype=glsl

" Remove trailing whitespaces.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Airline
" Enable powerline.
let g:airline_powerline_fonts = 1
" display all buffers
let g:airline#extensions#tabline#enabled = 1

" Autoformat
noremap <leader>f :Autoformat<CR>
let g:autoformat_verbosemode=1
" Disable fallback to vim defaults
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Define formatter tool commands.
let g:formatdef_clangformat = "'clang-format'"
" Map file types to formatters.
let g:formatters_opencl = ['clangformat']
let g:formatters_glsl = ['clangformat']

" CtrlP
" use mixed search per default
let g:ctrlp_cmd = 'CtrlPMixed'
" map search in directory to ctrl+o
" nnoremap <C-o> :CtrlP<space>
" set custom search command
let g:ctrlp_user_command = 'ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'

" cpsm
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_use_caching = 0

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" ctrlp-funky
" map funky to ctrl+l
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" ctrlsf
nmap <C-k> <Plug>CtrlSFPrompt

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}
let g:tagbar_type_typescript = {
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
    \ ]
  \ }

" YCM
" Set the rust search path.
" let g:ycm_rust_src_path = '/usr/src/rust/src'

" NERDTree
" Map nerdtreetoggle to ctrl+i.
" nnoremap <C-o> :NERDTreeToggle<CR>

" YCM
" nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>k :YcmCompleter GoToReferences<CR>
" nnoremap <leader>h :YcmCompleter GetType<CR>
" nnoremap <leader>l :YcmCompleter GetDoc<CR>

" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_auto_trigger = 1 " Automatically start autocompleting.
" Vimscript magic
" if !exists("g:ycm_semantic_triggers")
"    let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
" let g:ycm_disable_for_files_larger_than_kb = 1000
" let g:ycm_goto_buffer_command = 'vertical=split'
" nnoremap <leader>c :YcmCompleter RefactorRename

" Tsuquyomi
" let g:tsuquyomi_shortest_import_path = 1 " Relative import paths.

" JSX
let g:jsx_ext_required = 0

" Elm
" Don't use the default keybindings.
let g:elm_setup_keybindings = 0
