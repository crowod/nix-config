-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","

-----------------
-- Normal mode --
-----------------
keymap('n', '<C-s>', ':w<CR>', opts);
keymap('n', '<Leader>q', ':q!<CR>', opts);
keymap('n', '<Leader>qa', ':qa!<CR>', opts);
keymap('n', '<Leader>wq', ':wq!<CR>', opts);
keymap('n', '<Leader>c', '<C-w>c', opts);

-----------------
-- Visual mode --
-----------------
keymap('v', '<Leader>y', '"+y', opts)

-----------------
-- VS Code --
-----------------
if vim.g.vscode then
    keymap('n', 'gcc', "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", {})
end