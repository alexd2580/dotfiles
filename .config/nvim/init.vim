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
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'Yggdroot/indentLine'

" Utils
Plug 'Chiel92/vim-autoformat'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'        " ctags explorer
Plug 'tpope/vim-repeat'         " Remap . for plugins
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'

" Fuzzy file finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" CtrlP matcher (enhancer)
" Execute manually: PY3=ON ./install.sh
" Requires packages:
" ag, the_silver_searcher, python-neovim
" https://github.com/nixprime/cpsm
Plug 'nixprime/cpsm', { 'do': './install.sh' }

" Function navigator for ctrlp
" https://github.com/tacahiroy/ctrlp-funky
Plug 'tacahiroy/ctrlp-funky'

" I DONT KNOW WHAT THIS DOES BUT VIM.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Linter
Plug 'w0rp/ale'

" Typescript features.
" Plug 'Quramy/tsuquyomi'

" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'junegunn/fzf'
" Plug 'roxma/nvim-completion-manager'
" Plug 'Shougo/echodoc.vim'

call plug#end()

set updatetime=2000
set t_Co=256                " Set 256 color.
colorscheme gruvbox         " Define syntax color scheme.
set background=dark         " Adjust vim for dark colors.
set cursorline              " Show current cursor line.
set cursorcolumn            " Show current cursor column.
set number                  " Show line numbers.
set clipboard+=unnamedplus  " Yank and copy to X clipboard.
set shortmess+=I            " Disable the welcome screen.
let mapleader = ","         " Map leader to ,
set backspace=2             " Full backspacing capabilities.
set hidden                  " Enable buffer switching without saving.
set ww=<,>,[,]              " Whichwrap -- left/right keys can traverse up/down.
set scrolloff=3             " Keep 2 lines spacing between cursor and edge.
set expandtab               " Insert spaces instead of tab chars.
set tabstop=4               " A n-space tab width.
set shiftwidth=4            " Allows the use of < and > for VISUAL indenting.
set softtabstop=4           " Counts n spaces when DELETE or BCKSPCE is used.
set autoindent              " Auto indents next new line.
set smarttab                " Remember indent.
set list                    " Show invis characters (out of place chars?).
set ignorecase              " Case-insensitive search.
set smartcase               " Upper-case sensitive search.
set mouse=a                 " Mouse support.
set splitbelow              " Splitting a window will put the new window below the current.
set splitright              " Splitting a window will put the new window right of the current.

" Language settings.
" Highlight non-jsx files.
let g:jsx_ext_required = 0
" Don't use the default keybindings.
let g:elm_setup_keybindings = 0

" Enable Rainbow.
let g:rainbow_active = 1
autocmd VimEnter * RainbowToggle

" Additional C++ highlights.
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Turn off search highlight.
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>
nnoremap <F12> :bd<CR>

" Don't create a swap file.
set noswapfile

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
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
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

let g:ale_lint_on_text_changed = "never"

" Tsuquyomi
" let g:tsuquyomi_shortest_import_path = 1 " Relative import paths.

" Disable netrw for good.
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
