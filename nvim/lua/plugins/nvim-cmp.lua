return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",       -- Complete words from current buffer
        "hrsh7th/cmp-path",         -- Complete file paths
        "hrsh7th/cmp-nvim-lua",     -- Completions for nvim lua
        "hrsh7th/cmp-nvim-lsp",     -- LSP support (snippets?)
        "saadparwaiz1/cmp_luasnip", -- Snippets engine
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            -- Key mappings
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-y>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            -- Sources that are used to propose completions
            --   ordered by how they should appear in the completions list
            --   keyword_length: How many chars before completions show
            --   max_item_count: How many items to show from this source
            sources = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer", keyword_length = 5, max_item_count = 8 },
            }),
            -- Snippets support (not sure I even want this)
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            -- How completions should be formatted
            --formatting = {
            --    format = lspkind.cmp_format {
            --        with_text = true,
            --        menu = {
            --            buffer = "[buf]",
            --            nvim_lsp = "[LSP]",
            --            nvim_lua = "[lua]",
            --            path = "[path]",
            --            luasnip = "[snip]",
            --        }
            --    }
            --},
            -- Experimental features
            experimental = {
                -- New menu (tip from TJDeVries video)
                native_menu = false,
                -- Show preview of completion inline
                ghost_text = true
            }
        }
    end,
}
