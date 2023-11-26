-- Disable these providers?
-- TODO What does this actually do other than silence the checkhealth warnings?
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = "/usr/bin/python3"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Visual
vim.cmd "syntax off"         -- Disable default vim highlighting in favor of treesitter.
vim.opt.shortmess:append "I" -- Disable the welcome screen: https://neovim.io/doc/user/options.html#'shortmess'
vim.o.title = true           -- Write the file name to the X window title.
vim.o.cursorline = true      -- Draw crosshair X.
vim.o.cursorcolumn = true    -- Draw crosshair Y.
vim.o.list = true            -- Show invis characters (out of place chars?).
vim.cmd "set noshowmode"     -- Don't show `-- INSERT --`. Would conflict with echodoc.
vim.cmd "set nofoldenable"   -- Disable folding.
vim.o.winblend = 13          -- Fake window transparency. Looks nice.

-- Sidebar
-- TODO Relevant?
-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
vim.o.number = true          -- Show line numbers.
vim.cmd "set signcolumn=yes" -- Show extra signs column. Conflicts with gitgutter.

-- Behavior
vim.o.scrolloff = 5             -- Keep 4 lines spacing between cursor and edge.
vim.o.updatetime = 750          -- Lower updatetime might lead to glitches: https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
vim.o.clipboard = "unnamedplus" -- Yank and copy to X clipboard.
vim.o.ignorecase = true         -- Case-insensitive search.
vim.o.smartcase = true          -- Upper-case sensitive search.
vim.cmd "set noswapfile"        -- Don't create a swap file.

-- Indentation
vim.o.expandtab = true  -- Insert spaces instead of tab chars.
vim.o.tabstop = 4       -- A n-space tab width.
vim.o.shiftwidth = 4    -- Allows the use of < and > for VISUAL indenting.
vim.o.softtabstop = 4   -- Counts n spaces when DELETE or BCKSPCE is used.
vim.o.autoindent = true -- Auto indents next new line.
vim.o.smarttab = true   -- Remember indent.

-- Controls
vim.o.backspace = "2" -- https://neovim.io/doc/user/options.html#'backspace'
vim.o.mouse = "a"     -- Full mouse support.

-- Disable arrow keys!
vim.keymap.set("", "<Left>", "")
vim.keymap.set("", "<Right>", "")
vim.keymap.set("", "<Up>", "")
vim.keymap.set("", "<Down>", "")

vim.g.mapleader = ","

-- Turn off search highlight.
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")

-- Cycle through buffers.
vim.keymap.set("n", "<C-PageUp>", ":bp<CR>")
vim.keymap.set("n", "<C-PageDown>", ":bn<CR>")

local a = (((((((0)))))))

-- Remove trailing whitespaces:
-- http://vim.wikia.com/wiki/Remove_unwanted_spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  command = ":%s/\\s\\+$//e"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.mts" },
  command = "set ft=typescript"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.comp", "*.frag", "*.vert" },
  command = "set ft=glsl"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "vue", "jinja.html", "haskell", "lua" },
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  command = "syntax match Comment +\\/\\/.\\+$+"
})
