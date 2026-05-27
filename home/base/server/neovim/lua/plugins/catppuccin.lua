return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                term_colors = false,
                custom_highlights = function(colors)
                    return {
                        StatusLine = { bg = colors.none, fg = colors.none },
                    }
                end,
                integrations = {
                    hop = true,
                    treesitter = true,
                }
            })
        end
    }
}
