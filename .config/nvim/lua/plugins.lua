local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Beauty
  use "tiagovla/tokyodark.nvim"
  vim.cmd.colorscheme "tokyodark"

  use "bling/vim-airline"
  vim.g.airline_powerline_fonts = 1
  vim.g["airline#extensions#tabline#enabled"] = 1 -- Display all buffers.

  -- use "luochen1990/rainbow"
  -- vim.g.rainbow_active = 1
  -- vim.api.nvim_create_autocmd("VimEnter", { command = "RainbowToggle" })

  -- Conflict with rainbow on xml?
  use "Valloric/MatchTagAlways"

  -- Launcher
  use "ctrlpvim/ctrlp.vim"
  vim.g.ctrlp_cmd = "CtrlPMixed"
  vim.g.ctrlp_user_command =
  "ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g \"\""

  use { "nixprime/cpsm", run = "./install.sh" }
  vim.g.ctrlp_match_func = { match = "cpsm#CtrlPMatch" }
  vim.g.ctrlp_use_caching = 0

  use "tacahiroy/ctrlp-funky"
  vim.g.ctrlp_funky_matchtype = "path"
  vim.g.ctrlp_funky_syntax_highlight = 1
  -- nnoremap <C-l> :CtrlPFunky<CR>

  -- Search
  use "dyng/ctrlsf.vim"
  vim.g.ctrlsf_auto_focus = { at = "start" }
  vim.keymap.set("n", "<C-k>", "<Plug>CtrlSFPrompt")

  -- Utils
  use "tomtom/tcomment_vim"
  use "tpope/vim-repeat"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  use "bronson/vim-visual-star-search" -- Allow for searching by current visual selection.
  use "machakann/vim-highlightedyank"  -- Highlight what was just yanked.
  use "terryma/vim-multiple-cursors"

  use "terryma/vim-expand-region" -- +/_ to increase/decrease selection.


  -- Git tools
  use { "airblade/vim-gitgutter", branch = "main" }
  use "tpope/vim-fugitive"

  use "Shougo/echodoc.vim"
  vim.g["echodoc#enable_at_startup"] = 1
  vim.g["echodoc#type"] = "virtual"

  use "famiu/bufdelete.nvim"
  vim.keymap.set("n", "<F12>", ":Bdelete<CR>")

  -- Language support
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "neovim/nvim-lspconfig"

  -- Autocomplete
  use "hrsh7th/cmp-nvim-lsp" -- From LSC.
  use "hrsh7th/cmp-buffer"   -- From buffer?
  use "hrsh7th/cmp-path"     -- From local path
  use "hrsh7th/cmp-cmdline"  -- From command line?
  use "hrsh7th/nvim-cmp"     -- Actual plugin.
  use "hrsh7th/cmp-vsnip"    -- ??
  use "hrsh7th/vim-vsnip"    -- ??
  -- My virt-text display is nicer.
  -- use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

--
-- " -- Enable completion triggered by <c-x><c-o>
-- " -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
-- "
-- " -- vim.keymap.set('n', '<space>wl', function()
-- " -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- " -- end, opts)
--
-- " Local settings.
-- " lua <<EOF
-- "   local nvim_lsp = require('lspconfig')
-- "
-- "   nvim_lsp.pyright.setup {
-- "     on_init = function(client)
-- "       local path = client.workspace_folders[1].name
-- "
-- "       if path == '/home/sascha/code/shortform/backend' then
-- "         client.config.settings["pyright"].checkOnSave.overrideCommand = { "cargo", "check" }
-- "       end
-- "
-- "       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
-- "       return true
-- "     end
-- "     -- NOTE: you must spell out the config you wanna change in `on_init` inside `settings`.
-- "     settings = {
-- "       checkOnSave = { overrideCommand = {} } -- here
-- "     }
-- "   }
-- " EOF
