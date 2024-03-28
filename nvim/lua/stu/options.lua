local opt = vim.opt             -- Alias vim.opt

vim.g.mapleader = " "           -- Map leader to <Space>
opt.termguicolors = true        -- Terminal gui colors
opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20,o:hor50"

-- Tabs {{{
opt.autoindent = true           -- Automatically indent on newline
opt.expandtab = true            -- Use spaces instead of tabs
opt.tabstop = 4                 -- Tabs count for 4 spaces
opt.shiftwidth = 4              -- Width of a tab in spaces (insert/delete)
opt.softtabstop = 4             -- Width of a tab during editing
--}}}

-- Line numbers {{{
opt.relativenumber = true       -- Show relative line numbers
opt.number = true               -- Show real line number for current line
--}}}

-- Color column {{{
opt.colorcolumn = "79"          -- Show a color column at column 79
--}}}

-- Scrolloff {{{
opt.scrolloff = 10              -- Ensure at least 10 lines visible
--}}}

-- Bell {{{
opt.belloff = "all"             -- Turn off the bell
--}}}

-- Swapfile {{{
opt.swapfile = false            -- Disable swapfile (be sure to save!)
--}}}

-- Line breaks and wrapping {{{
opt.wrap = true                 -- Wrap long lines of text
opt.breakindent = true          -- Wrapped text inherits indent
opt.showbreak = ">>>"           -- Prefix wrapped lines with >>>
opt.linebreak = true            -- Break lines at 'breakat' chars
--}}}

-- Folding {{{
opt.foldmethod = "marker"       -- Use markers to define folds
opt.foldlevel = 0               -- All folds closed by default (level 0)
-- }}}

-- Fill chars {{{
opt.fillchars = { eob = "~" }   -- Fill empty lines at end of buffer with ~
-- }}}

-- Modelines {{{
-- Sets the number of lines that should be checked at the start or end of a 
--   file for modelines. A modeline specifies settings for that file only.
-- Example: -- vim:foldlevel=3
--   This would set the foldlevel to 3 just for that file.
opt.modelines = 1               -- Check 1 line at start & end for modelines
-- }}}

-- Hidden chars {{{
opt.list = true
opt.listchars = { lead = '·', trail = '·', eol = '↵' }
vim.cmd('highlight SpecialKey guifg=red ctermfg=green')
vim.cmd('highlight NonText guifg=red ctermfg=green')
--}}}

