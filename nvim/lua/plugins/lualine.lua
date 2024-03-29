-- vim: set tabstop=2 softtabstop=2 shiftwidth=2:

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local colors = require('stu.colors')
    return {
      options = {
        icons_enabled = true,
        theme = {
          normal = { 
            a = { fg = colors.gray.lightest, bg = colors.gray.normal } ,
            b = { fg = colors.gray.lightest, bg = colors.gray.darker },
            c = { fg = colors.gray.lightest, bg = colors.gray.darker },
            x = { fg = colors.gray.lightest, bg = colors.gray.darker },
            y = { fg = colors.gray.lightest, bg = colors.gray.darker },
            z = { fg = colors.gray.lightest, bg = colors.gray.darker },
          },
          insert = {
            a = { fg = colors.green.lightest, bg = colors.green.darker },
          },
          visual = {
            a = { fg = colors.purple.lightest, bg = colors.purple.darker },
          },
          replace = {
            a = { fg = colors.orange.lightest, bg = colors.orange.darker },
          }
        },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          'branch', 
          { 
            'diff', 
            symbols = {
              added = "+",
              modified = "u",
              removed = "x",
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          {
            'diagnostics',
            symbols = {
              error = "E",
              warn = "W",
              info = "I",
              hint = "H",
            }
          }
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end
}
