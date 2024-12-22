return {
  "andymass/vim-matchup",
  enabled = not vim.g.vscode,
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
