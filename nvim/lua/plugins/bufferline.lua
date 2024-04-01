-- vim: set tabstop=2 softtabstop=2 shiftwidth=2:

-- Bufferline Configuration
--
-- Bufferline introduces a tab-line for buffers at the top of the editor.
-- This file configures the plugin and sets up useful keymaps to interact 
--  with it.

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
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
