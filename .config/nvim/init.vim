call plug#begin('~/.config/nvim/plug')

" Languages
" - Desktop
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-jp/vim-cpp'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ElmCast/elm-vim'
" Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-python/python-syntax'

" - Mobile
Plug 'dart-lang/dart-vim-plugin'

" - Frontend
Plug 'othree/html5.vim'
" Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
Plug 'neoclide/vim-jsx-improve'
Plug 'JulesWang/css.vim'
Plug 'ianks/vim-tsx'
Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'

" - Other
Plug 'pearofducks/ansible-vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-json'
Plug 'kurayama/systemd-vim-syntax'

" Beauty
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'Valloric/MatchTagAlways'

" Utils
" Plug 'Chiel92/vim-autoformat'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'        " ctags explorer
Plug 'tpope/vim-repeat'         " Remap . for plugins
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-sayonara'
Plug 'tpope/vim-speeddating'
Plug 'Shougo/echodoc.vim'
Plug 'chrisbra/SudoEdit.vim'            " add :SudoWrite to save file with sudo
Plug 'bronson/vim-visual-star-search'   " allow for searching by current visual seleciton
Plug 'machakann/vim-highlightedyank'    " highlight what was just yanked

" Flutter
Plug 'thosakwe/vim-flutter'

" Fuzzy file finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" CtrlP matcher (enhancer)
" Execute manually: PY3=ON ./install.sh
" Requires packages:
" ag, the_silver_searcher, python-neovim
" https://github.com/nixprime/cpsm
Plug 'svenstaro/cpsm', { 'do': './install.sh' }

" Function navigator for ctrlp
" https://github.com/tacahiroy/ctrlp-funky
Plug 'tacahiroy/ctrlp-funky'

" I DONT KNOW WHAT THIS DOES BUT VIM.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" LSC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" General.
set title
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
set scrolloff=5             " Keep 4 lines spacing between cursor and edge.
set list                    " Show invis characters (out of place chars?).
set ignorecase              " Case-insensitive search.
set smartcase               " Upper-case sensitive search.
set mouse=a                 " Mouse support.
set splitbelow              " Splitting a window will put the new window below the current.
set splitright              " Splitting a window will put the new window right of the current.
set noshowmode              " Don't show `-- INSERT --`. Would conflict with echodoc.
set nofoldenable            " Disable folding.

" Indentation settings.
set expandtab               " Insert spaces instead of tab chars.
set tabstop=4               " A n-space tab width.
set shiftwidth=4            " Allows the use of < and > for VISUAL indenting.
set softtabstop=4           " Counts n spaces when DELETE or BCKSPCE is used.
set autoindent              " Auto indents next new line.
set smarttab                " Remember indent.

" Other.
set exrc    " allows loading local executing local rc files. (project specific .vimrc)
set secure  " disallows the use of :autocmd, shell and write commands in local .vimrc files.

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+

" Language settings.
" Highlight non-jsx files.
let g:vim_jsx_pretty_colorful_config = 1

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
nnoremap <F12> :bwipe<CR>

" Don't create a swap file.
set noswapfile

" Remove trailing whitespaces.
" For reference see: http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Airline
" Enable powerline.
let g:airline_powerline_fonts = 1
" display all buffers
let g:airline#extensions#tabline#enabled = 1

" Flutter
" let g:flutter_command = '/home/sascha/flutter/bin/flutter'
" nnoremap <leader>fs :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fr :FlutterHotReload<cr>
" nnoremap <leader>fR :FlutterHotRestart<cr>

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
" nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" ctrlsf
nmap <C-k> <Plug>CtrlSFPrompt

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_type_rust = {
    \'ctagstype' : 'rust',
    \'kinds' : [
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
    \'ctagstype': 'typescript',
    \'kinds': [
        \'c:classes',
        \'n:modules',
        \'f:functions',
        \'v:variables',
        \'v:varlambdas',
        \'m:members',
        \'i:interfaces',
        \'e:enums',
    \]
\}

set completeopt=menu,menuone,preview,noselect,noinsert
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" Disable netrw for good.
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" COC
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

autocmd BufWritePre *
    \ CocAction(format)
    \ CocAction(sortImports)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
