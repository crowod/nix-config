return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
            { "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle blame" },
        },
        config = function()
            require("gitsigns").setup()
        end
    }
}
