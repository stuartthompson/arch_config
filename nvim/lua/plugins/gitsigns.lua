-- vim: set tabstop=2 softtabstop=2 shiftwidth=2:
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "u" },
      delete = { text = "x" },
      topdelete = { text = "" },
      changedelete = { text = "|" },
      untracked = { text = "?" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- Hunk navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      -- Stage and reset in normal and visual mode
      map({"n","v"}, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({"n","v"}, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      -- Stage buffer, reset, undo
      map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      -- Diff
      map("n", "<leader>gd", gs.diffthis, "Diff This")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")

      -- Name <Leader>g as git commands (with which-key)
      require('which-key').register({
          ['<Leader>g'] = {
              name = '+Git Commands'
          }
      })
    end,
  },
} 
