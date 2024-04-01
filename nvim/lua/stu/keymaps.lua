vim.api.nvim_set_keymap('n', '<Leader>i', ':Inspect<CR>', { noremap = true, silent = true })

local wk = require("which-key")
local gs = require("gitsigns")

-- Raw keymaps
wk.register({
    -- Previous
    ["["] = {
        name = "Previous",
        h = { "<cmd>GitSigns prev_hunk<cr>", "Previous Hunk" },
    },
    -- Next
    ["]"] = {
        name = "Next",
        h = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    },
})

-- Leader keymaps
wk.register({
    -- Git
    g = {
        name = "Git",
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
        S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
        R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
        u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
        p = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview Hunk Inline" },
        b = { function() gs.blame_line({ full = true }) end, "Blame Line" },
        d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
        D = { function() gs.diffthis("~") end, "Diff This ~" },
    }
}, { prefix = "<leader>" })
