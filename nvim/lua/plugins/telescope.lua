local telescopeKeys = function()
    end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        priority = 100,
        config = function()
local builtin = require('telescope.builtin') -- Need reference to telescope builtin
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "find buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "find help" })
            vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = "pick colorscheme" })
        end,
    },
    "nvim-telescope/telescope-file-browser.nvim"
}
