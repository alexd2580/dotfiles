" Disable these providers?
" TODO What does this actually do other than silence the checkhealth warnings?
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0


" Visual.
set shortmess+=I            " Disable the welcome screen: https://neovim.io/doc/user/options.html#'shortmess'
set title
set cursorline              " Draw crosshair X.
set cursorcolumn            " Draw crosshair Y.
set list                    " Show invis characters (out of place chars?).
set noshowmode              " Don't show `-- INSERT --`. Would conflict with echodoc.
set nofoldenable            " Disable folding.
set winblend=13             " Fake window transparency. Looks nice.

" Sidebar.
" TODO Relevant?
" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set number                  " Show line numbers.
set signcolumn=yes          " Show extra signs column. Conflicts with gitgutter.

autocmd FileType json syntax match Comment +\/\/.\+$+


" Behavior.
set scrolloff=5             " Keep 4 lines spacing between cursor and edge.
set updatetime=750          " Lower updatetime might lead to glitches: https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set clipboard=unnamedplus   " Yank and copy to X clipboard.
set ignorecase              " Case-insensitive search.
set smartcase               " Upper-case sensitive search.
set noswapfile              " Don't create a swap file.

" Remove trailing whitespaces:
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Indentation.
set expandtab               " Insert spaces instead of tab chars.
set tabstop=4               " A n-space tab width.
set shiftwidth=4            " Allows the use of < and > for VISUAL indenting.
set softtabstop=4           " Counts n spaces when DELETE or BCKSPCE is used.
set autoindent              " Auto indents next new line.
set smarttab                " Remember indent.

autocmd BufNewFile,BufRead *.mts set ft=typescript
autocmd BufNewFile,BufRead *.comp set ft=glsl

autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType jinja.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Disable netrw for good.
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Controls.
set backspace=2             " https://neovim.io/doc/user/options.html#'backspace'
set mouse=a                 " Full mouse support.

" Disable arrow keys!
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>


" Bindings.
let mapleader = ","

" Turn off search highlight.
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>


" Plugins.
call plug#begin('~/.config/nvim/plug')

" Beauty.
Plug 'tiagovla/tokyodark.nvim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1    " Display all buffers.

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
autocmd VimEnter * RainbowToggle

" Conflict with rainbow on xml?
Plug 'Valloric/MatchTagAlways'


" Launcher.
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'

Plug 'nixprime/cpsm', { 'do': './install.sh' }
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
let g:ctrlp_use_caching = 0

Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <C-l> :CtrlPFunky<CR>


" Search.
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_focus = { "at": "start" }
nnoremap <C-k> <Plug>CtrlSFPrompt


" Utils.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'           " Allow for searching by current visual selection.
Plug 'machakann/vim-highlightedyank'            " Highlight what was just yanked.
Plug 'terryma/vim-multiple-cursors'

" Git tools.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

Plug 'famiu/bufdelete.nvim'
nnoremap <F12> :Bdelete<CR>


" Language support.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'


" Autocomplete.
Plug 'hrsh7th/cmp-nvim-lsp'                     " From LSC.
Plug 'hrsh7th/cmp-buffer'                       " From buffer?
Plug 'hrsh7th/cmp-path'                         " From local path
Plug 'hrsh7th/cmp-cmdline'                      " From command line?
Plug 'hrsh7th/nvim-cmp'                         " Actual plugin.
Plug 'hrsh7th/cmp-vsnip'                        " ??
Plug 'hrsh7th/vim-vsnip'                        " ??

call plug#end()

colorscheme tokyodark

lua <<EOF
  -- Initialize treesitter.
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    -- Ignore php (builds slowly).
    ignore_install = { "phpdoc" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
  }

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline('/', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })
  --
  -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = 'path' }
  --   }, {
  --     { name = 'cmdline' }
  --   })
  -- })

  -- Glue between autocomplete and lsp client.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Initialize lsp clients. Servers must be installed manually!
  -- TODO launch servers in isolated environments based on current filetype?
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ghcide
  require'lspconfig'.pyright.setup{capabilities = capabilities}
  require'lspconfig'.hls.setup{capabilities = capabilities}
  require'lspconfig'.dockerls.setup{capabilities = capabilities}
  require'lspconfig'.vuels.setup{capabilities = capabilities}
  require'lspconfig'.jsonls.setup{capabilities = capabilities, cmd = {"vscode-json-languageserver", "--stdio"}}
  require'lspconfig'.tsserver.setup{capabilities = capabilities}
  require'lspconfig'.ltex.setup{capabilities = capabilities}
  require'lspconfig'.bashls.setup{capabilities = capabilities} -- Install shellcheck.
  require'lspconfig'.clangd.setup{capabilities = capabilities}
  require'lspconfig'.cmake.setup{capabilities = capabilities}
  require'lspconfig'.vimls.setup{capabilities = capabilities}
  require'lspconfig'.yamlls.setup{capabilities = capabilities}
  require'lspconfig'.html.setup{capabilities = capabilities, cmd = {"vscode-html-languageserver", "--stdio"}}
  require'lspconfig'.rust_analyzer.setup{capabilities = capabilities, cmd = {"rustup", "run", "nightly", "rust-analyzer"}}
  -- require'lspconfig'.glslls.setup{capabilities = capabilities}
EOF

nnoremap [g :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]g :lua vim.diagnostic.goto_next()<CR>

nnoremap <silent> <leader>e :lua vim.diagnostic.open_float()<CR>     " Open floating window above diagnostic.
nnoremap <silent> <leader>q :lua vim.diagnostic.setloclist()<CR>     " Open trayer with all diagnostics.

nnoremap gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>

nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f :lua vim.lsp.buf.format()<CR>

nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>             " TODO autoshow on hover?
nnoremap <leader>s :lua vim.lsp.buf.signature_help()<CR>    " What does this do?

nnoremap <leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>

" Show only first line of diagnostic in virtual text.
lua <<EOF
  format_diagnostic = function(diagnostic)
    return diagnostic.message:gmatch('[^\n]+')()
  end
  vim.diagnostic.config({
      virtual_text = { format = format_diagnostic },
      update_in_insert = true
  })
EOF

" -- Enable completion triggered by <c-x><c-o>
" -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

"
" -- vim.keymap.set('n', '<space>wl', function()
" -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
" -- end, opts)

" Local settings.
" lua <<EOF
"   local nvim_lsp = require('lspconfig')
"
"   nvim_lsp.pyright.setup {
"     on_init = function(client)
"       local path = client.workspace_folders[1].name
"
"       if path == '/home/sascha/code/shortform/backend' then
"         client.config.settings["pyright"].checkOnSave.overrideCommand = { "cargo", "check" }
"       end
"
"       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
"       return true
"     end
"     -- NOTE: you must spell out the config you wanna change in `on_init` inside `settings`.
"     settings = {
"       checkOnSave = { overrideCommand = {} } -- here
"     }
"   }
" EOF
