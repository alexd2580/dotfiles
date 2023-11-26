-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client)
  client.server_capabilities.semanticTokensProvider = nil
end

local load_lsp_client = function(client_name, extra_client_args)
  local client_args = { capabilities = capabilities, on_attach = on_attach }
  for key, value in pairs(extra_client_args or {}) do
    client_args[key] = value
  end

  lspconfig[client_name].setup(client_args)
end

-- Initialize lsp clients. Servers must be installed manually!
-- TODO launch servers in isolated environments based on current filetype?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ghcide
load_lsp_client('pyright', { cmd = { "pyright-langserver", "--stdio" } })
load_lsp_client 'hls'
load_lsp_client 'dockerls'
load_lsp_client 'vuels'
load_lsp_client('jsonls', { cmd = { "vscode-json-languageserver", "--stdio" } })
load_lsp_client 'tsserver'
load_lsp_client 'ltex'
load_lsp_client 'bashls' -- Install shellcheck.
load_lsp_client 'clangd'
load_lsp_client 'cmake'
load_lsp_client 'vimls'
load_lsp_client 'yamlls'
load_lsp_client 'glslls'
load_lsp_client('html', { cmd = { "vscode-html-languageserver", "--stdio" } })
load_lsp_client('rust_analyzer',
  { settings = { ["rust-analyzer"] = { diagnostics = { disabled = { "unresolved-proc-macro" } } } },
    cmd = { "rustup", "run", "stable", "rust-analyzer" } })
load_lsp_client('lua_ls', { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float) -- Open floating diag window.
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist) -- Open trayer with all diag info.

vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help)

vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)

-- Show only first line of diagnostic in virtual text.
local format_diagnostic = function(diagnostic)
  return diagnostic.message:gmatch('[^\n]+')()
end
vim.diagnostic.config({
  virtual_text = { format = format_diagnostic },
  float = { border = "rounded" },
  update_in_insert = true
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

local define_gutter_sign = function(id, icon)
  vim.fn.sign_define(id, { texthl = id, text = icon, numhl = id })
end

define_gutter_sign("DiagnosticSignError", "")
define_gutter_sign("DiagnosticSignWarn", "")
define_gutter_sign("DiagnosticSignHint", "")
define_gutter_sign("DiagnosticSignInfo", "")
