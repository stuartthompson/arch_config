return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.rust_analyzer.setup {
            settings = {
                ['rust-analyzer'] = {},
            },
        }
    end,
}
