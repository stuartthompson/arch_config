vim.api.nvim_set_keymap('n', '<Leader>i', ':Inspect<CR>', { noremap = true, silent = true })

local wk = require("which-key")
local ts = require("telescope.builtin")
local gs = require("gitsigns")

-- Raw keymaps
wk.register({
    -- Previous
    ["["] = {
        name = "Previous",
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer (tab)" },
        h = { "<cmd>GitSigns prev_hunk<cr>", "Previous hunk" },
    },
    -- Next
    ["]"] = {
        name = "Next",
        b = { "<cmd>BufferLineCycleNext<cr>", "Next buffer (tab)" },
        h = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    },
})

-- Leader keymaps
wk.register({
    -- Bufferline (Tabs)
    b = {
        name = "Buffers (Tabs)",
        p = { "<cmd>BufferLineTogglePin<cr>", "Toggle buffer pin" },
        o = { "<cmd>BufferLineCloseOthers<cr>", "Close other buffers" },
        r = { "<cmd>BufferLineCloseRight<cr>", "Close buffers to right" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close buffers to left" },
        ["["] = { "<cmd>BufferLineMovePrev<cr>", "Move buffer left" },
        ["]"] = { "<cmd>BufferLineMoveNext<cr>", "Move buffer right" },
        c = { "<cmd>bd<cr>", "Close current buffer" },

    },
    -- Debugging (nvim_dap)
    d = {
        name = "Debug",
        b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },
        c = { "<cmd>DapContinue<cr>", "Continue" },
        d = { "<cmd>RustLsp debuggables<cr>", "Debuggables" },
        x = { "<cmd>DapTerminate<cr>", "Terminate debugger" },
        o = { "<cmd>DapStepOver<cr>", "Step over" },
        i = { "<cmd>DapStepInto<cr>", "Step info" },
    },
    -- Telescope (Find Files)
    f = {
        name = "Find Files",
        f = { ts.find_files, "Find files" },
        g = { ts.live_grep, "Live grep files" },
        b = { ts.buffers, "Find buffers" },
        h = { ts.help_tags, "Find help" },
        i = {
            name = "Find ignored files",
            f = { function() ts.find_files({ no_ignore = true }) end, "Find files (incl. ignored)" },
            g = { function() ts.live_grep({ no_ignore = true }) end, "Live grep (incl. ignored)" },
        }
    },
    -- Git
    g = {
        name = "Git",
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
        S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
        R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
        u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
        p = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview hunk inline" },
        b = { function() gs.blame_line({ full = true }) end, "Blame line" },
        d = { "<cmd>Gitsigns diffthis<cr>", "Diff this" },
        D = { function() gs.diffthis("~") end, "Diff this ~" },
    },
    -- LSP
    l = {
        name = "LSP Support",
        h = { vim.lsp.buf.hover, "Show LSP Hover" },
    },
    -- Rustacean
    r = {
        name = "Rustacean",
        h = { "<cmd>RustLsp hover actions<cr>", "Show Rustacean hover popup" },
    },
    -- Tree
    t = {
        name = "Tree (File Explorer)",
        t = { "<cmd>Neotree action=focus source=filesystem<cr>", "Show file tree" },
        b = { "<cmd>Neotree action=focus source=buffers<cr>", "Show buffer tree" },
        f = { "<cmd>Neotree action=focus<cr>", "Focus file tree" },
        c = { "<cmd>Neotree action=close<cr>", "Close file tree" },
    },
}, { prefix = "<leader>" })
 
