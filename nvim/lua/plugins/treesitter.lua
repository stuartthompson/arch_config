-- Treesitter

return {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    event = "VeryLazy",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { 
            "bash",
            "c",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "regex",
            "rust",
            "toml",
            "typescript",
            "vim",
            "xml",
            "yaml"
        }
    }
}
