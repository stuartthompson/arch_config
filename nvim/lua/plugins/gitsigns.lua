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
  },
} 
