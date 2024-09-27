require 'nvim-treesitter.configs'.setup {
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

vim.treesitter.language.register("bash", "zsh")
