return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSInstallFromGrammar", "TSLog" },
        config = function()
            require("nvim-treesitter.config").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "json", "yaml", "markdown", "tmux", "gotmpl" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
