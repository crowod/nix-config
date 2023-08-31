--- This module will load a random colorscheme on nvim startup process.

local M = {}

M.colorscheme2dir = {
    catppuccin = "catppuccin",
}

M.catppuccin = function()
    vim.cmd([[colorscheme catppuccin]])
end

require("catppuccin").setup {
    custom_highlights = function(colors)
        return {
            StatusLine = {bg = colors.none, fg = colors.none},
        }
    end
}

M.catppuccin()

