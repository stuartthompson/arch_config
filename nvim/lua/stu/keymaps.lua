vim.api.nvim_set_keymap('n', '<Leader>i', ':Inspect<CR>', { noremap = true, silent = true })

local wk = require("which-key")
wk.register({
    g = {
        name = "Git",
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    }
}, { prefix = "<leader>" })
      -- Hunk navigation
      --map("n", "]h", gs.next_hunk, "Next Hunk")
      --map("n", "[h", gs.prev_hunk, "Prev Hunk")
      ---- Stage and reset in normal and visual mode
      --map({"n","v"}, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      --map({"n","v"}, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      ---- Stage buffer, reset, undo
      --map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
      --map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      --map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
      --map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
      --map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      ---- Diff
      --map("n", "<leader>gd", gs.diffthis, "Diff This")
      --map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")

