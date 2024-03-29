local telescopeKeys = function()
    end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        priority = 100,
        config = function()
            -- Require and alias telescope.builtin
            local builtin = require('telescope.builtin')
            -- Find files
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
            -- Find files (including files listed in .gitignore)
            vim.keymap.set('n', '<leader>fif', function() builtin.find_files({no_ignore = true}) end, { desc = "find files (+ignored)" })
            -- Find using grep
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
            -- Find using grep (including files listed in .gitignore)
            vim.keymap.set('n', '<leader>fig', function() builtin.live_grep({no_ignore = true}) end, { desc = "live grep (+ignored)" })
            -- Find buffers
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "find buffers" })
            -- Find help articles
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "find help" })
        end,
    },
    "nvim-telescope/telescope-file-browser.nvim"
}
