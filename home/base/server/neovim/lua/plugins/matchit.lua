return {
    "andymass/vim-matchup",
    enabled = not vim.g.vscode,
    event = { "BufReadPost", "BufNewFile" },
    init = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
        vim.g.matchup_delim_stopline = 10000
    end,
}
