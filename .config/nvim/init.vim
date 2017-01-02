call plug#begin('~/.config/nvim/plug')

" Status line
" https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'

" Autoformat tool
" https://github.com/Chiel92/vim-autoformat
Plug 'Chiel92/vim-autoformat'

" Fuzzy file finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" CtrlP matcher (enhancer)
" Execute manually: PY3=ON ./install.sh
" Requires packages:
" ag, the_silver_searcher, python-neovim
" https://github.com/nixprime/cpsm
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }

" Function navigator for ctrlp
" https://github.com/tacahiroy/ctrlp-funky
Plug 'tacahiroy/ctrlp-funky'

" Search tool
" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'

" https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'

" Ctags explorer
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

" GLSL support
" https://github.com/tikhomirov/vim-glsl
Plug 'tikhomirov/vim-glsl'

" File-type sensitive comments
" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'

" Remap . for plugins
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" Add surroundings
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Youcompleteme blahblahblah
" Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --system-libclang --system-boost --all' }

" Rust language support
" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

" Typescript language support
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

call plug#end()

set t_Co=256            " set 256 color
colorscheme gruvbox     " define syntax color scheme
set background=dark     " adjust vim for dark colors 
set cursorline          " show current cursor line
set cursorcolumn        " show current cursor column
set number              " show line numbers
set clipboard+=unnamed  " yank and copy to X clipboard
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

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" don't create a swap file
set noswapfile

" explicitly set filetype for .comp files
" required until https://github.com/tikhomirov/vim-glsl/pull/10 is merged
autocmd BufRead,BufNewFile *.comp set filetype=glsl

" Airline
" enable powerline
let g:airline_powerline_fonts = 1
" display all buffers
let g:airline#extensions#tabline#enabled = 1

" Autoformat
" map autoformat
noremap <leader>f :Autoformat<CR>
" enable verbose output
let g:autoformat_verbosemode=1
" disable fallback to vim defaults
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" define formatter tool commands
let g:formatdef_clangformat = "'clang-format'"
let g:formatdef_rustformat= "'/usr/bin/rustfmt --write-mode display'"
" map file types to formatters
let g:formatters_opencl = ['clangformat']
let g:formatters_glsl = ['clangformat']
let g:formatters_rust = ['rustformat']

" CtrlP
" use mixed search per default
let g:ctrlp_cmd = 'CtrlPMixed'
" map search in directory to ctrl+o
nnoremap <C-o> :CtrlP<space>
" set custom search command
let g:ctrlp_user_command = 'ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'

" cpsm
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" ctrlp-funky
" map funky to ctrl+l
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" ctrlsf
" map ctrlsf to ctrl+k
nmap <C-k> <Plug>CtrlSFPrompt

" Tagbar
" map tagbar to f8
nnoremap <silent> <F8> :TagbarToggle<CR>

" YCM
" set the rust search path
let g:ycm_rust_src_path = '/usr/src/rust/src'

