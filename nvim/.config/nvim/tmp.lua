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

  -- Launcher
  use "ctrlpvim/ctrlp.vim"
  -- vim.g.ctrlp_cmd = "CtrlPMixed"
  vim.g.ctrlp_user_command = "ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g \"\""

  -- use "tacahiroy/ctrlp-funky"
  -- vim.g.ctrlp_funky_matchtype = "path"
  -- vim.g.ctrlp_funky_syntax_highlight = 1
  -- vim.keymap.set("n", "<C-l>", ":CtrlPFunky<CR>")

  -- use { "nixprime/cpsm", run = "./install.sh" }
  -- vim.g.ctrlp_match_func = { match = "cpsm#CtrlPMatch" }
  -- vim.g.ctrlp_use_caching = 0

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
