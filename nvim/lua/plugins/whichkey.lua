return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        plugins = {
            -- The presets to load into which-key (what should show up)
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                nav = true,
                z = true,
                g = true,
            }
        }
    }
}
