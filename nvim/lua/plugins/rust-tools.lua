return {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
            },
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
        })
    end
}
