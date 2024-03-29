-- vim: set tabstop=2 softtabstop=2 shiftwidth=2:

-- Bufferline Configuration
--
-- Bufferline introduces a tab-line for buffers at the top of the editor.
-- This file configures the plugin and sets up useful keymaps to interact 
--  with it.

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle buffer pin" },
    { "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    { "<Leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to right" },
    { "<Leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to left" },
    { "<Leader>b[", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
    { "<Leader>b]", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
    { "<Leader>bc", "<Cmd>bd<CR>", desc = "Close current buffer" },
    { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
  },
  opts = {
    options = {
      always_show_bufferline = false,
      numbers = "ordinal",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        }
      }
    }
  }
}
