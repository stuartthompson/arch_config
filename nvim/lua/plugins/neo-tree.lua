-- NeoTree Configuration
--
-- This plugin provides a file tree browser as a side bar.

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    -- :Neotree action=show source=buffers position=right toggle=true
    keys = {
        { "<Leader>tt", "<Cmd>Neotree action=focus source=filesystem<CR>", desc = "Show file tree" },
        { "<Leader>tb", "<Cmd>Neotree action=focus source=buffers<CR>", desc = "Show buffer tree" },
        { "<Leader>tf", "<Cmd>Neotree action=focus<CR>", desc = "Focus file tree" },
        { "<Leader>tc", "<Cmd>Neotree action=close<CR>", desc = "Close file tree" },
    }
}
